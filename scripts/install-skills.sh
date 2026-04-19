#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
SOURCE_SKILLS_DIR="${REPO_ROOT}/skills"
INVOCATION_DIR="$(pwd -P)"
CALLER_REPO_ROOT="$(git -C "${INVOCATION_DIR}" rev-parse --show-toplevel 2>/dev/null || printf '%s\n' "${INVOCATION_DIR}")"

MODE="symlink"
FORCE=0
DRY_RUN=0
IN_REPO=0
TARGETS=()

CODEX_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
CLAUDE_DIR="${CLAUDE_CODE_HOME:-${CLAUDE_HOME:-$HOME/.claude}}/skills"
OPENCODE_DIR="${OPEN_CODE_HOME:-${OPENCODE_HOME:-$HOME/.config/opencode}}/skills"
AGENTS_DIR="${AGENTS_HOME:-${CALLER_REPO_ROOT}/.agents}/skills"
REPO_INSTALL_ROOT="${CALLER_REPO_ROOT}"
CUSTOM_CODEX_DIR=0
CUSTOM_CLAUDE_DIR=0
CUSTOM_OPENCODE_DIR=0
CUSTOM_AGENTS_DIR=0
ARG_COUNT=$#

usage() {
  cat <<'EOF'
Usage:
  scripts/install-skills.sh [options]

Install all repository skills into Codex, Claude Code, and/or OpenCode.

Options:
  --target NAME         Install to one target. Repeatable.
                        Supported: codex, claude, claude-code, opencode, open-code, agents, all
  --mode MODE           Install mode: symlink or copy. Default: symlink
  --force               Replace existing installed skills
  --dry-run             Print actions without modifying the filesystem
  --in-repo             Install into directories inside the current repository
  --repo-dir PATH       Base directory to use with --in-repo. Default: caller repository root
  --codex-dir PATH      Override Codex skills directory
  --claude-dir PATH     Override Claude Code skills directory
  --opencode-dir PATH   Override OpenCode skills directory
  --agents-dir PATH     Override .agents skills directory
  --help                Show this help

Default target directories:
  Codex:       ${CODEX_HOME:-$HOME/.codex}/skills
  Claude Code: ${CLAUDE_CODE_HOME:-${CLAUDE_HOME:-$HOME/.claude}}/skills
  OpenCode:    ${OPEN_CODE_HOME:-${OPENCODE_HOME:-$HOME/.config/opencode}}/skills
  Agents:      <repo-root>/.agents/skills (default when no --target is given)

Examples:
  scripts/install-skills.sh --target codex --mode symlink
  scripts/install-skills.sh --target claude-code --target opencode --mode copy
  scripts/install-skills.sh --target all --mode symlink --force
  scripts/install-skills.sh --target all --mode symlink --in-repo
  scripts/install-skills.sh --target opencode --opencode-dir "$HOME/custom/opencode/skills"
  scripts/install-skills.sh  # installs to .agents/skills in current repo
EOF
}

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

run() {
  if [[ "${DRY_RUN}" -eq 1 ]]; then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

normalize_target() {
  case "$1" in
    codex)
      printf 'codex\n'
      ;;
    claude|claude-code)
      printf 'claude\n'
      ;;
    opencode|open-code)
      printf 'opencode\n'
      ;;
    agents)
      printf 'agents\n'
      ;;
    all)
      printf 'all\n'
      ;;
    *)
      return 1
      ;;
  esac
}

append_target() {
  local target="$1"
  local existing
  for existing in "${TARGETS[@]:-}"; do
    if [[ "${existing}" == "${target}" ]]; then
      return 0
    fi
  done
  TARGETS+=("${target}")
}

resolve_target_dir() {
  case "$1" in
    codex)
      printf '%s\n' "${CODEX_DIR}"
      ;;
    claude)
      printf '%s\n' "${CLAUDE_DIR}"
      ;;
    opencode)
      printf '%s\n' "${OPENCODE_DIR}"
      ;;
    agents)
      printf '%s\n' "${AGENTS_DIR}"
      ;;
    *)
      return 1
      ;;
  esac
}

replace_existing() {
  local destination="$1"

  if [[ ! -e "${destination}" && ! -L "${destination}" ]]; then
    return 0
  fi

  if [[ "${FORCE}" -ne 1 ]]; then
    return 1
  fi

  run rm -rf "${destination}"
  return 0
}

install_skill() {
  local mode="$1"
  local source="$2"
  local destination="$3"

  case "${mode}" in
    symlink)
      run ln -s "${source}" "${destination}"
      ;;
    copy)
      run cp -a "${source}" "${destination}"
      ;;
    *)
      fail "Unsupported mode: ${mode}"
      ;;
  esac
}

install_target() {
  local target="$1"
  local destination_root="$2"
  local skill_dir skill_name destination
  local installed_count=0
  local skipped_count=0

  log
  log "Installing skills for ${target} -> ${destination_root}"
  run mkdir -p "${destination_root}"

  for skill_dir in "${SOURCE_SKILLS_DIR}"/*; do
    [[ -d "${skill_dir}" ]] || continue

    skill_name="$(basename -- "${skill_dir}")"
    destination="${destination_root}/${skill_name}"

    if ! replace_existing "${destination}"; then
      log "  skip  ${skill_name} (already exists, use --force to replace)"
      skipped_count=$((skipped_count + 1))
      continue
    fi

    install_skill "${MODE}" "${skill_dir}" "${destination}"
    log "  ok    ${skill_name}"
    installed_count=$((installed_count + 1))
  done

  log "Summary for ${target}: installed=${installed_count} skipped=${skipped_count} mode=${MODE}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || fail "Missing value for --target"
      normalized_target="$(normalize_target "$2")" || fail "Unsupported target: $2"
      if [[ "${normalized_target}" == "all" ]]; then
        append_target "codex"
        append_target "claude"
        append_target "opencode"
        append_target "agents"
      else
        append_target "${normalized_target}"
      fi
      shift 2
      ;;
    --mode)
      [[ $# -ge 2 ]] || fail "Missing value for --mode"
      case "$2" in
        symlink|copy)
          MODE="$2"
          ;;
        *)
          fail "Unsupported mode: $2"
          ;;
      esac
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --in-repo)
      IN_REPO=1
      shift
      ;;
    --repo-dir)
      [[ $# -ge 2 ]] || fail "Missing value for --repo-dir"
      REPO_INSTALL_ROOT="$2"
      shift 2
      ;;
    --codex-dir)
      [[ $# -ge 2 ]] || fail "Missing value for --codex-dir"
      CODEX_DIR="$2"
      CUSTOM_CODEX_DIR=1
      shift 2
      ;;
    --claude-dir)
      [[ $# -ge 2 ]] || fail "Missing value for --claude-dir"
      CLAUDE_DIR="$2"
      CUSTOM_CLAUDE_DIR=1
      shift 2
      ;;
    --opencode-dir)
      [[ $# -ge 2 ]] || fail "Missing value for --opencode-dir"
      OPENCODE_DIR="$2"
      CUSTOM_OPENCODE_DIR=1
      shift 2
      ;;
    --agents-dir)
      [[ $# -ge 2 ]] || fail "Missing value for --agents-dir"
      AGENTS_DIR="$2"
      CUSTOM_AGENTS_DIR=1
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      fail "Unknown argument: $1"
      ;;
  esac
done

if [[ "${#TARGETS[@]}" -eq 0 ]]; then
  append_target "agents"
fi

if [[ ! -d "${SOURCE_SKILLS_DIR}" ]]; then
  fail "Skills directory not found: ${SOURCE_SKILLS_DIR}"
fi

if [[ "${IN_REPO}" -eq 1 ]]; then
  if [[ "${CUSTOM_CODEX_DIR}" -eq 0 ]]; then
    CODEX_DIR="${REPO_INSTALL_ROOT}/.codex/skills"
  fi
  if [[ "${CUSTOM_CLAUDE_DIR}" -eq 0 ]]; then
    CLAUDE_DIR="${REPO_INSTALL_ROOT}/.claude/skills"
  fi
  if [[ "${CUSTOM_OPENCODE_DIR}" -eq 0 ]]; then
    OPENCODE_DIR="${REPO_INSTALL_ROOT}/.opencode/skills"
  fi
  if [[ "${CUSTOM_AGENTS_DIR}" -eq 0 ]]; then
    AGENTS_DIR="${REPO_INSTALL_ROOT}/.agents/skills"
  fi
fi

log "Repository root: ${REPO_ROOT}"
log "Source skills: ${SOURCE_SKILLS_DIR}"
log "Install mode: ${MODE}"
if [[ "${FORCE}" -eq 1 ]]; then
  log "Existing installs: replace"
else
  log "Existing installs: keep"
fi
if [[ "${DRY_RUN}" -eq 1 ]]; then
  log "Filesystem changes: disabled (--dry-run)"
fi
if [[ "${IN_REPO}" -eq 1 ]]; then
  log "Repository-local install root: ${REPO_INSTALL_ROOT}"
fi

for target in "${TARGETS[@]}"; do
  install_target "${target}" "$(resolve_target_dir "${target}")"
done

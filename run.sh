#!/bin/bash
# Lançador do Vial-GUI a partir do código-fonte.
#
# Por que não `fbs run`? A versão grátis do fbs (CLI) só roda em Python 3.5/3.6,
# que não compila em Apple Silicon / macOS atual. O app em si só precisa do
# `fbs_runtime`, então rodamos o main.py direto — funciona normalmente.
#
# Uso:  ./run.sh
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

if [ ! -x venv/bin/python ]; then
    echo "venv não encontrada. Crie com:  PYENV_VERSION=3.10.18 python3 -m venv venv"
    exit 1
fi

exec env PYTHONPATH=src/main/python venv/bin/python src/main/python/main.py "$@"

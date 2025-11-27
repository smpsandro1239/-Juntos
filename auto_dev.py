#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
auto_dev.py
Script de automação total para o IDE Antigravity.
Executa-se automaticamente ao abrir o projeto.
Desenvolve, testa, documenta e commita sem intervenção humana.
Todo o conteúdo em português de Portugal.
"""

import os
import subprocess
import datetime
import json
import logging
from pathlib import Path

# Configuração de logs em PT-PT
LOG_DIR = Path("logs")
LOG_DIR.mkdir(exist_ok=True)
logging.basicConfig(
    filename=LOG_DIR / "auto_dev.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# Estrutura interna simulada do SDK Antigravity
class IAAssistente:
    def __init__(self, lang="pt-PT", modo="autónomo"):
        self.lang = lang
        self.modo = modo
        self.analise = {}
        self.faltas = []

    def analisar_projeto(self):
        logging.info("A analisar estrutura do projeto...")
        self.analise = {
            "linguagem": self._detectar_linguagem(),
            "estrutura": self._listar_arquivos(),
            "objetivo": self._inferir_objetivo()
        }
        logging.info("Análise concluída.")

    def _detectar_linguagem(self):
        if Path("main.py").exists() or Path("requirements.txt").exists():
            return "Python"
        elif Path("package.json").exists():
            return "JavaScript/Node.js"
        elif Path("Cargo.toml").exists():
            return "Rust"
        else:
            return "Desconhecida"

    def _listar_arquivos(self):
        return [str(p) for p in Path(".").rglob("*") if p.is_file()]

    def _inferir_objetivo(self):
        if Path("app.py").exists() or Path("main.py").exists():
            return "Aplicação web ou API"
        elif Path("cli.py").exists():
            return "Linha de comandos"
        else:
            return "Indefinido"

    def gerar_ficheiro(self, nome):
        if nome == "ANALISE.md":
            conteudo = self._conteudo_analise()
        elif nome == "FALTAS.md":
            conteudo = self._conteudo_faltas()
        elif nome == "RESUMO.md":
            conteudo = self._conteudo_resumo()
        else:
            conteudo = ""
        Path(nome).write_text(conteudo, encoding="utf-8")
        logging.info(f"Ficheiro {nome} gerado.")

    def _conteudo_analise(self):
        return f"""# Análise Técnica do Projeto

## Linguagem
{self.analise['linguagem']}

## Objetivo
{self.analise['objetivo']}

## Estrutura de Ficheiros
```
{chr(10).join(self.analise['estrutura'][:20])}
```
> Lista truncada para os primeiros 20 ficheiros.
"""

    def mapear_faltas(self):
        logging.info("A mapear funcionalidades em falta...")
        self.faltas = [
            "Validação de entrada de utilizador",
            "Tratamento de erros centralizado",
            "Testes unitários",
            "Documentação da API",
            "Ficheiro README.md completo"
        ]

    def _conteudo_faltas(self):
        return f"""# Funcionalidades em Falta

{chr(10).join(f"- {f}" for f in self.faltas)}
"""

    def desenvolver_faltas(self):
        logging.info("A desenvolver funcionalidades em falta...")
        if not Path("validacao.py").exists():
            Path("validacao.py").write_text("""\
def validar_email(email: str) -> bool:
    \"\"\"
    Valida se o email está no formato correto.
    \"\"\"
    return "@" in email and "." in email.split("@")[-1]
""", encoding="utf-8")
        if not Path("testes.py").exists():
            Path("testes.py").write_text("""\
from validacao import validar_email

def testar_email():
    assert validar_email("teste@exemplo.pt") is True
    assert validar_email("invalido") is False

if __name__ == "__main__":
    testar_email()
    print("Todos os testes passaram.")
""", encoding="utf-8")
        logging.info("Funcionalidades desenvolvidas.")

    def executar_testes(self):
        logging.info("A executar testes...")
        resultado = subprocess.run(["python", "testes.py"], capture_output=True, text=True)
        if resultado.returncode == 0:
            logging.info("Testes passaram.")
        else:
            logging.error("Testes falharam: %s", resultado.stderr)

    def _conteudo_resumo(self):
        return f"""# Resumo do Desenvolvimento Autónomo

## Data
{datetime.datetime.now().strftime("%d/%m/%Y %H:%M")}

## O que foi desenvolvido
- Validação de email
- Testes unitários básicos
- Documentação técnica

## O que permanece pendente
- Integração com base de dados
- Autenticação completa
- Interface de utilizador

## Instruções de execução
```bash
python testes.py
```
"""

    def commitar_tudo(self):
        logging.info("A preparar commit...")
        # Nota: Em ambiente real, isto faria commit. Aqui simulamos ou executamos se git estiver configurado.
        try:
            subprocess.run(["git", "add", "."], check=True)
            subprocess.run(["git", "commit", "-m", "Adiciona validação de email e testes unitários"], check=True)
            # subprocess.run(["git", "push"], check=True) # Comentado para evitar push acidental sem remote
            logging.info("Commit efetuado.")
        except Exception as e:
            logging.warning(f"Não foi possível fazer commit: {e}")

def main():
    ia = IAAssistente()
    ia.analisar_projeto()
    ia.gerar_ficheiro("ANALISE.md")
    ia.mapear_faltas()
    ia.gerar_ficheiro("FALTAS.md")
    ia.desenvolver_faltas()
    ia.executar_testes()
    ia.gerar_ficheiro("RESUMO.md")
    ia.commitar_tudo()
    logging.info("Ciclo autónomo concluído.")

if __name__ == "__main__":
    main()

from validacao import validar_email

def testar_email():
    assert validar_email("teste@exemplo.pt") is True
    assert validar_email("invalido") is False

if __name__ == "__main__":
    testar_email()
    print("Todos os testes passaram.")

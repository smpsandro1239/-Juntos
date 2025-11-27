def validar_email(email: str) -> bool:
    """
    Valida se o email está no formato correto.
    """
    return "@" in email and "." in email.split("@")[-1]

# Como Executar no IntelliJ IDEA (Passo a Passo)

O comando "Run/Debug" **não é para escrever no terminal**. É um botão dentro do programa IntelliJ IDEA.

Siga estes passos exatos:

## 1. Abrir o Projeto
1. Abra o **IntelliJ IDEA**.
2. Clique em **File** > **Open...**
3. Selecione a pasta: `C:\laragon\www\+Juntos\juntos\backend\service-core`
4. Clique em **OK**.
5. Aguarde o IntelliJ carregar o projeto (pode demorar alguns minutos a indexar e baixar dependências).

## 2. Localizar o Ficheiro Principal
1. Na barra lateral esquerda (Project), navegue pelas pastas:
   - `src`
     - `main`
       - `kotlin`
         - `pt`
           - `juntos`
             - `core`
2. Encontre o ficheiro **`JuntosApplication.kt`**.

## 3. Executar a Aplicação
1. Clique com o **botão direito** do rato em cima do ficheiro `JuntosApplication.kt`.
2. No menu que aparece, clique na opção que tem um triângulo verde ▶️ e diz:
   **Run 'JuntosApplicationKt'**

## 4. Verificar se funcionou
- Na parte de baixo do IntelliJ, vai abrir uma janela chamada **Run**.
- Vai aparecer muito texto a passar.
- Quando parar, deve ver uma mensagem parecida com:
  `Started JuntosApplication in X.XXX seconds`

---

**Só depois disto** é que pode ir ao browser e tentar fazer login em `http://localhost:5173`.

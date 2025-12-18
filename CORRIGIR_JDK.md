# Como Corrigir "Invalid Gradle JDK configuration"

O IntelliJ precisa de saber onde está o Java para conseguir executar o projeto.

## Passo a Passo

1. No IntelliJ, clique na mensagem de erro **"Open Gradle Settings"** (ou vá a **File** > **Settings** > **Build, Execution, Deployment** > **Build Tools** > **Gradle**).

2. Na janela de definições do Gradle, procure a opção **"Gradle JVM"** na parte de baixo.

3. Clique no menu dropdown (onde provavelmente diz "Project SDK" ou está vazio).

4. Selecione uma versão do Java **21**.
   - Se não tiver "version 21" na lista, clique em **"Download JDK..."**.
   - Escolha:
     - **Version:** 21
     - **Vendor:** Eclipse Temurin (ou Amazon Corretto)
     - Clique em **Download**.

5. Depois de selecionar o Java 21, clique em **Apply** e **OK**.

6. O IntelliJ vai começar a re-indexar o projeto (pode ver uma barra de progresso em baixo).

7. Quando terminar, tente executar o `JuntosApplication.kt` novamente (clique direito > Run).

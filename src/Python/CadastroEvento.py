import mysql.connector

meudb = mysql.connector.connect(
   host='localhost',
   user='root',
   password='root',
   database='conectabem'
)

cursor = meudb.cursor()


# =========================
# FUNÇÃO CRIAR EVENTO
# =========================
def criar_evento():

   print("\n=== CADASTRO DE EVENTO ===")

   id = int(input("ID do evento: "))
   nome = input("Nome do evento: ")
   statuseve = input("Status do evento: ")
   dataeve = input("Data (AAAA-MM-DD): ")
   periodo = input("Período: ")
   qntdmin = int(input("Quantidade mínima: "))
   qntdmax = int(input("Quantidade máxima: "))
   rua = input("Rua: ")
   numero = input("Número: ")
   compl = input("Complemento: ")
   bairro = input("Bairro: ")
   cidade = input("Cidade: ")
   uf = input("UF: ")
   meta = float(input("Meta financeira: "))
   msg = input("Mensagem para os participantes: ")
   descr = input("Descrição: ")
   ger = int(input("ID do gerente: "))

   cursor.callproc(
       "criarEvento",
       [
           id, nome, statuseve, dataeve, periodo,
           qntdmin, qntdmax, rua, numero, compl,
           bairro, cidade, uf, meta, msg, descr, ger
       ]
   )

   meudb.commit()

   print("\nEvento criado com sucesso!\n")


# =========================
# FUNÇÃO EDITAR EVENTO
# =========================
def editar_evento():

   print("\n=== EDIÇÃO DE EVENTO ===")

   id_evento = int(input("ID do evento que deseja editar: "))

   nome = input("Novo nome do evento: ")
   statuseve = input("Novo status do evento: ")
   dataeve = input("Nova data (AAAA-MM-DD): ")
   periodo = input("Novo período: ")
   qntdmin = int(input("Nova quantidade mínima: "))
   qntdmax = int(input("Nova quantidade máxima: "))
   rua = input("Nova rua: ")
   numero = input("Novo número: ")
   compl = input("Novo complemento: ")
   bairro = input("Novo bairro: ")
   cidade = input("Nova cidade: ")
   uf = input("Novo UF: ")
   meta = float(input("Nova meta financeira: "))
   msg = input("Nova mensagem: ")
   descr = input("Nova descrição: ")

   cursor.callproc(
       "editarEvento",
       [
           id_evento,
           nome,
           statuseve,
           dataeve,
           periodo,
           qntdmin,
           qntdmax,
           rua,
           numero,
           compl,
           bairro,
           cidade,
           uf,
           meta,
           msg,
           descr
       ]
   )

   meudb.commit()

   print("\nEvento atualizado com sucesso!\n")


# =========================
# FUNÇÃO EXCLUIR EVENTO
# =========================
def excluir_evento():

   print("\n=== EXCLUSÃO DE EVENTO ===")

   nome_evento = input("Nome do evento que deseja excluir: ")

   confirmacao = input(
       f"Tem certeza que deseja excluir '{nome_evento}'? (s/n): "
   )

   if confirmacao.lower() == "s":

       cursor.callproc(
           "excluirEvento",
           [nome_evento]
       )

       meudb.commit()

       print("\nEvento(s) excluído(s) com sucesso!\n")

   else:
       print("\nExclusão cancelada.\n")


# =========================
# MENU PRINCIPAL
# =========================
while True:

   print("===== MENU =====")
   print("1 - Criar Evento")
   print("2 - Editar Evento")
   print("3 - Excluir Evento")
   print("0 - Sair")

   A = int(input("Selecione uma opção: "))

   if A == 1:
       criar_evento()

   elif A == 2:
       editar_evento()

   elif A == 3:
       excluir_evento()

   elif A == 0:
       print("\nEncerrando sistema...")
       break

   else:
       print("\nOpção inválida!\n")
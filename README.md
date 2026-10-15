# CRM Mini

**Grupo:**
- Alan Oliveira Rocha, RA: 2500557
- Gustavo Palomo Moura, RA: 2500355
- João Carlos Vieira do Nascimento, RA: 2501305
- Lucas Keiji Kuada, RA: 2500169
- Mário Nascimento Martins, RA: 2500954

**Disciplina:** Innovation Lab - SaaS Infrastructure

**Professor:** Dr. Alessandro Kraemer

## Descrição
Aplicação simples de cadastro de clientes por departamento, em 3 camadas
(banco de dados MySQL, servidor de aplicação Tomcat, acesso web), para ser
disponibilizada como SaaS em uma VM.

## Estrutura
- `conf/CRM_mini.sql`: script do banco de dados (2 tabelas: departamento e cliente)
- `conf/crm_mini.xml`: arquivo de contexto do Tomcat
- `webapp/`: aplicação (index.html e clientes.jsp)

## Como implantar na VM
    ssh saas@IP_DA_VM
    sudo su
    cd /opt/tomcat10
    git clone https://github.com/mariomartinsimpacta/crm_mini.git
    mysql -u root < crm_mini/conf/CRM_mini.sql
    mkdir /opt/tomcat10/crm_mini_app && cp crm_mini/webapp/* /opt/tomcat10/crm_mini_app/
    cp crm_mini/conf/crm_mini.xml /opt/tomcat10/conf/Catalina/localhost/
    (ajuste docBase no XML se necessario)
Acesso: http://IP_DA_VM:8080/crm_mini

---

## ADR 01 - Escolha da tecnologia de banco de dados
- **Título:** Escolha do MySQL como banco de dados
- **Data:** 2026-10-15
- **Responsável:** Mário Nascimento Martins
- **Status:** Aceito

### Contexto
O sistema precisa armazenar clientes e departamentos com relacionamento entre eles.

### Decisão
Utilizar o MySQL, banco de dados relacional.

### Justificativa
- Modelagem de relações entre tabelas com integridade referencial.
- Transações garantem consistência dos dados.
- Boa documentação e possibilidade de escalar no futuro.

### Consequências
Permite modelagem MER e manuseio dos dados via SQL. Limitação: exige esquema definido antes de inserir dados.

## ADR 02 - Escolha do servidor de aplicação
- **Título:** Escolha do Apache Tomcat 10
- **Data:** 2026-10-15
- **Responsável:** Mário Nascimento Martins
- **Status:** Aceito

### Contexto
A aplicação precisa ficar acessível por HTTP dentro da infraestrutura SaaS.

### Decisão
Utilizar o Tomcat 10 na VM Ubuntu, com a aplicação em /opt/tomcat10.

### Consequências
Suporta HTML e Java (JSP) e tem painel de gerenciamento na porta 8080. Limitação: configuração manual do contexto e do driver JDBC.

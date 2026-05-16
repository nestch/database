# Nestch Database

Imagem MySQL para deploy no Railway usando Docker.

## Railway

Este projeto usa a imagem oficial do MySQL:

```dockerfile
FROM mysql:8.0
```

Configure as variáveis de ambiente no Railway:

```env
MYSQL_DATABASE=nestch
MYSQL_ROOT_PASSWORD=sua_senha_segura
MYSQL_USER=nestch_user
MYSQL_PASSWORD=sua_senha_segura
```

## Volume

No Railway, mantenha um volume persistente montado em:

```text
/var/lib/mysql
```

Isso evita perda dos dados ao recriar o container.

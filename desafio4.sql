SELECT
  usr.name AS 'usuario',
    IF(
      MAX(hstry.date_rep) > '2021-01-01',
        'Usuário ativo',
        'Usuário inativo'
    ) AS 'condicao_usuario'
FROM
  user AS usr
    INNER JOIN
  history AS hstry ON usr.id = hstry.user_id
GROUP BY hstry.user_id
ORDER BY usr.name;
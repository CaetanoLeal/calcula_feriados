
CREATE OR REPLACE FUNCTION "public"."fn_calcula_feriado"("data_inicial" date, "data_final" date)
  RETURNS TABLE("id_feriado" bpchar, "nome_feriado" varchar, "data_feriado" date) AS $BODY$
BEGIN
  RETURN QUERY
  SELECT *
    FROM (SELECT A.id_feriado, A.nome_feriado, TO_DATE(A.ano  A.mes  A.dia, 'YYYY-MM-DD') AS data_feriado
            FROM feriados A
           WHERE A.codigo_tipo_feriado = 1
           UNION ALL
          SELECT A.id_feriado, A.nome_feriado, TO_DATE(B.ano  A.mes  A.dia, 'YYYY-MM-DD') AS data_feriado
            FROM feriados A, (SELECT DISTINCT B1.ano
                                   FROM (SELECT EXTRACT('YEAR' FROM TO_DATE(data_inicial::TEXT, 'YYYY-MM-DD')) AS ano
                                          UNION ALL
                                         SELECT EXTRACT('YEAR' FROM TO_DATE(data_final::TEXT, 'YYYY-MM-DD')) AS ano) B1) B
           WHERE A.codigo_tipo_feriado = 2
           UNION ALL
          SELECT A.id_feriado, A.nome_feriado, TO_DATE((A.data_semana + (A.codigo_semana - A.codigo_semana_inicial) * INTERVAL '1 DAY')::TEXT, 'YYYY-MM-DD') AS dt_feriado
            FROM (SELECT A1.id_feriado, A1.nome_feriado, A1.codigo_semana, A1.ordem_semana, A1.mes
                        ,EXTRACT('DOW' FROM TO_DATE(data_inicial::TEXT, 'YYYY-MM-DD')) AS codigo_semana_inicial
                        ,TO_DATE(data_inicial::TEXT, 'YYYY-MM-DD') + A1.ordem_semana * INTERVAL '1 WEEK' AS data_semana
                    FROM feriados A1
                   WHERE A1.codigo_tipo_feriado = 3
                     AND A1.mes IN (SELECT EXTRACT('MONTH' FROM data_inicial) UNION ALL SELECT EXTRACT(MONTH FROM data_final))) A) Z
   WHERE Z.data_feriado BETWEEN data_inicial AND data_final;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000
-- mostrar todas tabelas do sistemas
-- tamanho_total das tabelas aumenta dependendo de index, etcs...
SELECT esquema, tabela,
       pg_size_pretty(pg_relation_size(esq_tab)) AS tamanho,
       pg_size_pretty(pg_total_relation_size(esq_tab)) AS tamanho_total
  FROM (SELECT tablename AS tabela,
               schemaname AS esquema,
               schemaname||'.'||tablename AS esq_tab
          FROM pg_catalog.pg_tables
         WHERE schemaname NOT
            IN ('pg_catalog', 'information_schema', 'pg_toast') ) AS x
 ORDER BY pg_total_relation_size(esq_tab) DESC;

-- mostrar tamanho das tabelas do teste.
 SELECT --esquema,
		tabela,
       pg_size_pretty(pg_relation_size(esq_tab)) AS tamanho,
       pg_size_pretty(pg_total_relation_size(esq_tab)) AS tamanho_total
  FROM (SELECT tablename AS tabela,
               schemaname AS esquema,
               schemaname||'.'||tablename AS esq_tab
          FROM pg_catalog.pg_tables
         WHERE tablename 
            IN ('tabela_100colunas_cem_mil_registros', 'tabela_50colunas_cem_mil_registros', 
				'tabela_100colunas_milhao_registro','tabela_50colunas_milhao_registro',
			   'tabela_100colunas_integer','tabela_50colunas_integer') 
	 ) AS x
 ORDER BY pg_total_relation_size(esq_tab) DESC;
 
select
substr(lower(column_name),0,1) || substr(replace(initcap(column_name),'_',''),2) || ': {
    columnName: ''' || column_name || ''',
    type: ''' || decode(data_type,
                        'VARCHAR2', 'string',
                        'CHAR', 'string',
                        'DATE', 'date',
                        'NUMBER', 'integer',
                        null) || '''
},'
from user_tab_columns
where table_name = '<table_here>'
order by column_id

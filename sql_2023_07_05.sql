select * from mvc_board;
delete from mvc_board where bid != 1;
commit;

SELECT bid, bname, btitle, bcontent, bdate, bhit 
from (SELECT rownum rn, bid, bname, btitle, bcontent, bdate, bhit 
    FROM mvc_board
--    WHERE (btitle like '%' || 'app' || '%') AND ����
--    WHERE (bcontent like '%' || '19' || '%') AND ����
--    WHERE (bname like '%' || 'ark' || '%') AND �ۼ���
    WHERE
--    ���� or ����
--    (btitle like '%' || 'app' || '%'
--    OR bcontent like '%' || '19' || '%'
--    ) AND

--    ���� or �ۼ���
--    (btitle like '%' || 'app' || '%'
--    OR bname like '%' || 'ark' || '%'
--    ) AND
    
--    ���� or �ۼ���
--    (bcontent like '%' || '19' || '%'
--    OR bname like '%' || 'ark' || '%'
--    ) AND
    
--    ���� or ���� or �ۼ���
    (btitle like '%' || 'app' || '%'
    OR bcontent like '%' || '19' || '%'
    OR bname like '%' || 'ark' || '%'
    ) AND
    
    ROWNUM <= (1 * 10)
    order by bid desc
)
WHERE rn > (1-1) * 10;




SELECT bid, bname, btitle, bcontent, bdate, bhit
from (SELECT rownum rn, bid, bname, btitle, bcontent, bdate, bhit
      FROM mvc_board
      WHERE 
      (  btitle like '%' || app || '%' )
      AND ROWNUM <= (? * ?)
      order by bid desc)
WHERE rn > (?-1) * ?
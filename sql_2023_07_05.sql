select * from mvc_board;
delete from mvc_board where bid != 1;
commit;

SELECT bid, bname, btitle, bcontent, bdate, bhit 
from (SELECT rownum rn, bid, bname, btitle, bcontent, bdate, bhit 
    FROM mvc_board
--    WHERE (btitle like '%' || 'app' || '%') AND 제목
--    WHERE (bcontent like '%' || '19' || '%') AND 내용
--    WHERE (bname like '%' || 'ark' || '%') AND 작성자
    WHERE
--    제목 or 내용
--    (btitle like '%' || 'app' || '%'
--    OR bcontent like '%' || '19' || '%'
--    ) AND

--    제목 or 작성자
--    (btitle like '%' || 'app' || '%'
--    OR bname like '%' || 'ark' || '%'
--    ) AND
    
--    내용 or 작성자
--    (bcontent like '%' || '19' || '%'
--    OR bname like '%' || 'ark' || '%'
--    ) AND
    
--    제목 or 내용 or 작성자
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
create sequence seq_board;

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

alter table tbl_board add constraint pk_board 
primary key (bno);

INSERT INTO tbl_board (bno,title,content,writer)
VALUES (seq_board.nextval, '테스트 제목','테스트 내용','user00');

SELECT * FROM TBL_BOARD; -- 테이블 확인

SELECT * FROM TBL_BOARD WHERE bno > 0;

SELECT * FROM TBL_BOARD ORDER BY bno DESC; --게시물 번호 역순으로 처리

INSERT INTO tbl_board (bno,title,content,writer)
(SELECT seq_board.nextval, title, content, writer FROM tbl_board);

SELECT * FROM TBL_BOARD ORDER BY bno DESC;

SELECT 
/* + INDEX_DEXC(tbl_board pk_board) */
*
FROM 
	TBL_BOARD
WHERE BNO > 0; 

SELECT /*+FULL(tbl_board) */ * FROM TBL_BOARD ORDER BY bno DESC;

SELECT /*+INDEX_DESC (tbl_board pk_board) */*
FROM tbl_board;

SELECT  /*+ INDEX_ASC(tbl_board pk_board) */ * FROM tbl_board WHERE bno > 0;

SELECT rownum rn,bno,title FROM TBL_BOARD; --rownum 테이블 확인
 
SELECT /*+ FULL(tbl_board) */
rownum rn,bno,title
FROM TBL_BOARD WHERE bno > 0
ORDER BY bno;

SELECT  /*+ INDEX_ASC(tbl_board pk_board) */ 
rownum rn,bno,title,content
FROM tbl_board;

SELECT  /*+ INDEX_DESC(tbl_board pk_board) */ 
rownum rn,bno,title,content
FROM tbl_board
WHERE ROWNUM <=10;

SELECT  /*+ INDEX_DESC(tbl_board pk_board) */ 
rownum rn,bno,title,content 
FROM tbl_board
WHERE rownum <=20;


--인라인 뷰 방식
SELECT 
	rn,BNO,TITLE,CONTENT
FROM 
	(
	SELECT  /*+ INDEX_DESC(tbl_board pk_board) */ 
		rownum rn,bno,title,content
	FROM 
		tbl_board  
	WHERE ROWNUM <=40
	)  
WHERE rn > 10;

SELECT 
*
FROM 
	(
		SELECT /*+INDEX_DESC(tbl_board pk_board) */
			rownum rn, bno, title, content, writer, regdate, updatedate
		FROM 
			tbl_board
		WHERE
			(title LIKE '%테스트%' OR CONTENT LIKE '%테스트%')
			AND rownum <= 20
	)
WHERE rn > 10;
	



	
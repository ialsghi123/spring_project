create table tbl_reply (
  rno number(10,0), 
  bno number(10,0) not null,
  reply varchar2(1000) not null,
  replyer varchar2(50) not null, 
  replyDate date default sysdate, 
  updateDate date default sysdate
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply  add constraint fk_reply_board  
foreign key (bno)  references  tbl_board (bno);

SELECT * FROM TBL_REPLY; -- 테이블 조회

SELECT * FROM TBL_BOARD WHERE rownum < 10 ORDER BY bno DESC;

SELECT * FROM TBL_REPLY ORDER BY rno DESC;

CREATE INDEX idx_reply ON tbl_reply (bno DESC,rno asc);

SELECT /*+INDEX(tbl_reply idx_reply) */
	rownum rn,bno,rno,reply,replyer,replyDate,updatedate
	FROM TBL_REPLY
	WHERE bno = 145745 --(게시물 번호)
	AND rno>0
	
SELECT rno,bno,reply,replyer,replydate,updatedate
FROM 
	(
	SELECT /*+INDEX(tbl_reply idx_reply) */
	rownum rn,bno,rno,reply,replyer,replyDate,updatedate
	FROM TBL_REPLY
	WHERE bno = 589819
		  AND rno >0
		  AND rownum <=20
	) WHERE rn>10


	
	
	
	
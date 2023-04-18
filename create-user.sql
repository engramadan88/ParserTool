alter session set "_oracle_script"=true;
create user parser identified by parser;
grant dba to parser;
/
create table parser.usage
(
id number not null,
cpu_usage number not null,
ram_usage number not null,
timestamp date not null
);
alter table parser.usage add constraint usage_pk primary key (id);
/
create sequence parser.usage_seq;
create trigger parser.usage_trg
before insert on parser.usage for each row
declare
begin
    if :new.id is null then
        select parser.usage_seq.nextval
        into :new.id
        from dual;
    end if;
end;
/
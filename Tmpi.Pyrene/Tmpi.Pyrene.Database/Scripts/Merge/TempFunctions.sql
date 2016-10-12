if (OBJECT_ID('[dbo].[TMP_BBAN_TO_IBAN]')) is not null
BEGIN
	drop function [dbo].[TMP_BBAN_TO_IBAN];
END;
GO
create function [dbo].[TMP_BBAN_TO_IBAN]
(
	@bban varchar(30),
	@country char(2)
)
returns varchar(40)
as
	-- Creates an IBAN (International Bank Account Number) from a BBAN (Basic Bank Account Number) and BIC (Bank Identifier Code)
BEGIN 
	declare @bbanwk varchar(60), @bbannbp int, @bbanp varchar(9), @pos smallint, @mod int, @i smallint, @keyiban char(2), @iban varchar(40)
	-- Place it at the end of BBAN
	set @bbanwk = @bban + @country + '00'
	-- Replace any letters with their numeric value (code ASCII - 55)
	while isnumeric(@bbanwk+'e0') = 0
		BEGIN
			set @pos = (select patindex('%[^0-9]%',@bbanwk))
			set @bbanwk = (select replace(@bbanwk,substring(@bbanwk,@pos,1),ascii(substring(@bbanwk,@pos,1))-55))
		END
	-- Split the BBAN into parts of 9 numbers max (because too long for SQL data type INT) and calculate MOD 97 of each part
	-- suppose to add 1 iteration each 4 iteration, so init @i = 0 and not 1 for some case.
	set @bbannbp = ceiling(len(@bbanwk) / 9.0) 
	set @pos = 10
	set @i = 0
	set @bbanp = left(@bbanwk, 9)
	while @i <= @bbannbp
		BEGIN
			set @mod = cast(@bbanp as int) % 97
			-- Put the result at the beginning of the next group			
			set @bbanp = cast(@mod as varchar) + substring(@bbanwk, @pos, 7)
			set @i = @i + 1
			set @pos = @pos + 7
		END
	-- IBAN key 2 characters
	set @keyiban = right('00' + cast((98 - @mod) as varchar), 2)
	set @iban = @country + @keyiban + @bban
RETURN @iban
END;

GO

if (OBJECT_ID('[dbo].[TMP_SPLIT]')) is not null
BEGIN
	drop function [dbo].[TMP_SPLIT];
END;
GO
create function [dbo].[TMP_SPLIT]
(
	@text varchar(8000),
	@separator varchar(20) = ','
)
returns @strings table
(
	rownum int identity primary key,
	column_value varchar(8000)
)
as
	-- Retourne une table contenant les sous-chaînes de "@text" qui sont délimitées par "@separator"
	--
BEGIN
	declare @index int
	set @index = -1

	while (len(@text) > 0)
	begin
		set @index = charindex(@separator , @text)
		if (@index = 0) and (len(@text) > 0)
		begin
			insert into @strings values (@text)
			break
		end
		if (@index > 1)
		begin
			insert into @strings values (left(@text, @index - 1))
			set @text = right(@text, (len(@text) - @index))
		end
		else
			set @text = right(@text, (len(@text) - @index))
	end

	return
END;

GO

if (OBJECT_ID('[dbo].[TMP_SPLIT]')) is not null
BEGIN
	drop function [dbo].[TMP_PrfService];
END;
GO
create function [dbo].[TMP_PrfService]
(
	@CleSociete int,
	@CleSecteur int,
	@CleService int
)
returns int
as
BEGIN
	set @CleSociete=nullif(@CleSociete,0)
	set @CleSecteur=nullif(@CleSecteur,0)
	set @CleService=nullif(@CleService,0)

	if (@CleService is null)
	begin
		if (@CleSecteur is null)
		begin
			return @CleSociete
		end
		else begin
			return @CleSecteur+1000
		end
	end
	else begin
		return @CleService+20000
	end

	return null
END;


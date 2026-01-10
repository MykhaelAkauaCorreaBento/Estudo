select sum(qtde) from (
select CountryCode, count(IsOfficial) qtde, sum(Percentage)
	from countrylanguage 
	where IsOfficial = 'T' 
group by CountryCode
having count(IsOfficial) > 1) t;
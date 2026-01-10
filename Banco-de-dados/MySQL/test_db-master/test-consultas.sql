select cid.name, cid.Population, p.name , l.Language, p.code, p.Capital, p.LifeExpectancy, cap.name
from city cid, country p, countrylanguage l, city cap
where cid.CountryCode = p.code
and p.code = l.countrycode
and p.capital = cap.id
and l.IsOfficial = 'T';


select CountryCode, count(IsOfficial), Percentage, Language
from countrylanguage 

where IsOfficial = 'T' 
group by CountryCode, Percentage, Language;

--Em consultas com GROUP BY, todos os campos do SELECT devem estar na cláusula GROUP BY ou ser utilizados em funções de agregação (em conformidade com o padrão SQL).
--O GROUP BY deve ser aplicado a atributos que representem uma característica comum entre os registros, permitindo o agrupamento de valores iguais. Agrupar atributos que variam para cada registro ou que contenham valores NULL pode gerar resultados sem significado analítico, embora seja sintaticamente válido.





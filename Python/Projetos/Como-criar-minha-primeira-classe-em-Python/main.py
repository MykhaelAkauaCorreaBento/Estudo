from pessoa_fisica import PessoaFisica
from pessoa_juridica import PessoaJuridica

a = PessoaFisica("123.456.789-00", "João", idade=30)

print(a.getCPF())
print(a.getNome())
print(a.getIdade())

b= PessoaJuridica("12.345.678/0001-00", "Empresa XYZ", idade=30)

print(b.getCNPJ())
print(b.getNome())
print(b.getIdade())
import express from 'express';
import cors from 'cors';

import { RetornaLeads } from './servico/servico_leads.js';
import { ValidaDadosAutenticacao } from './validacao/valida_autenticacao.js';
import { GeraToken, validaToken } from './servico/servico_autenticacao.js';

const app = new express();

app.use(express.json());
app.use(cors());

app.post('/login', (req, res) => {
	const usuario = req.body.usuario; 
	const senha = req.body.senha; 

	const autenticacaoValida = ValidaDadosAutenticacao(usuario, senha);
	
	if(!autenticacaoValida) {
		res.status(401).send({message: "Usuário não autorizado"});
		return;
	}
	
	const token = GeraToken();

	res.status(200).send({token: token});
});

app.get('/lista-leads', async(req, res) => {
	let token;
	
	if(typeof req.headers.authorization !== 'undefined') 
	{
		token = req.headers.authorization.split(' ')[1];
	} 
	else 
	{
		token = -1;
	}
	
	const tokenValido = validaToken(token);

	if(!tokenValido.status) {
		res.status(tokenValido.codigo).end();
		return;
	} 

	const listaLeads = await RetornaLeads();

	res.status(tokenValido.codigo).send({listaLeads});
});

app.listen(9000, async () => {
	console.log("Servidor Iniciado");
});
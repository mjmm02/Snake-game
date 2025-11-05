programa
{
	//Jogo da cobra criado por Miguel Martins

	//Importa as bibliotecas necessárias para as funções usadas no programa
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		//Inicializa as variáveis necessárias para o programa
		const inteiro dim_x = 20, dim_y = 20, LARGURA_JANELA = 600, ALTURA_JANELA = 400
		caracter dir = 'S'
		logico pause = falso
		inteiro img_apple, img_snek, pos[100][2], pos_x = 0, 
			pos_y = 0, pos_xe = 20, pos_ye = 80, aux = 0, pos_xa = 0, pos_ya = 0,
			i_size = 4, i_inicial = 0, speed = 10, VERDE1 = 0, n_ciclo = 0, pos_xt = 0,
			pos_yt = 0, spause = 0, speed2 = 0, tecl = 0

		//VERDE1 = g.criar_cor(0, 100, 0)

		i_inicial = i_size

		//Posição inicial x e y da cabeça da cobra gerada aleatoriamente
		pos_x = u.sorteia(5, LARGURA_JANELA / dim_x - 5) * 20
		pos_y = u.sorteia(5, ALTURA_JANELA / dim_y - 5) * 20

		//Posição inicial x e y da maçã gerada aleatoriamente
		pos_xe = u.sorteia(1, LARGURA_JANELA / dim_x - 1) * 20
		pos_ye = u.sorteia(1, ALTURA_JANELA / dim_y - 1) * 20

		//Atribui a posição x e y inicial da cabeça e restantes segmentos do corpo da cobra numa matriz
		pos[i_size - 1][0] = pos_x
		pos[i_size - 1][1] = pos_y
		pos[i_size - 2][0] = pos_x
		pos[i_size - 2][1] = pos_y - 20
		pos[i_size - 3][0] = pos_x
		pos[i_size - 3][1] = pos_y - 40

		//img_apple = g.carregar_imagem("C:\\Users\\Migue\\OneDrive\\Pictures\\pixel-apple.png")
		//img_apple = g.redimensionar_imagem(img_apple, 20, 20, falso)
		
		//img_snek = g.carregar_imagem("C:\\Users\\Migue\\OneDrive\\Pictures\\snake_skin.png")
		//img_snek = g.redimensionar_imagem(img_snek, 20, 20, falso)

		//Inicia a janela do jogo e define as suas dimensões e título
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
		//g.entrar_modo_tela_cheia()
		g.definir_titulo_janela("Snake game")
	
		//Faz um compasso de espera antes do ciclo do jogo iniciar
		//u.aguarde(1000)

		//Inicia o ciclo do jogo
		enquanto(falso == falso){


			//tecla_press = falso
			aux = 0
			
			//Aguarda pelo input do jogador dentro do ciclo e sai ao fim de 10 loops se não houver nenhum input
			faca{
				aux++
				u.aguarde(speed)
				//tecla_press = t.alguma_tecla_pressionada()
					
				se(t.tecla_pressionada(t.TECLA_W) == verdadeiro ou t.tecla_pressionada(t.TECLA_SETA_ACIMA)){
					se(dir != 'S'){
						dir = 'W'
					}
				}
				senao se(t.tecla_pressionada(t.TECLA_S)  == verdadeiro ou t.tecla_pressionada(t.TECLA_SETA_ABAIXO)){
					se(dir != 'W'){
						dir = 'S'	
					}
				}
				senao se(t.tecla_pressionada(t.TECLA_A) == verdadeiro ou t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)){
					se(dir != 'D'){
						dir = 'A'	
					}
				}
				senao se(t.tecla_pressionada(t.TECLA_D) == verdadeiro ou t.tecla_pressionada(t.TECLA_SETA_DIREITA)){
					se(dir != 'A'){
						dir = 'D'
					}
				}
				senao se(t.tecla_pressionada(t.TECLA_ESC) == verdadeiro){
					g.fechar_janela()
				}
				senao se(t.tecla_pressionada(t.TECLA_ESPACO) == verdadeiro){
					t.ler_tecla()
					se(spause == 0){
						pause = verdadeiro
						spause = 1
					}
					senao{
						pause = falso
						spause = 0
					}
				}
				
			}
			enquanto(aux < 10)

			se(pause == falso){
			//Actualiza a posição da cobra depois do input do jogador (W,A,S,D)
				se(dir == 'W'){
					pos_yt = pos_y
					pos_y = pos_y - 20
					pos[i_size - 1][1] = pos_y
				}
				senao se(dir == 'S'){
					pos_yt = pos_y
					pos_y = pos_y + 20
					pos[i_size - 1][1] = pos_y
				}
				senao se(dir == 'A'){
					pos_xt = pos_x
					pos_x = pos_x - 20
					pos[i_size - 1][0] = pos_x
				}
				senao se(dir == 'D'){
					pos_xt = pos_x
					pos_x = pos_x + 20
					pos[i_size - 1][0] = pos_x
				}
	
				//Acaba o jogo se a cabeça da cobra atinge um segmento do proprio corpo
				se(i_size > 1){
					para(inteiro i = 0; i < i_size - 1; i++){
						se(pos[i_size - 1][0] == pos[i][0] e pos[i_size - 1][1] == pos[i][1]){
							u.aguarde(500)
							g.fechar_janela()
						}
					}	
				}
	
				//Actualiza posições horizontal e vertical no vector da cobra
				para(inteiro i = i_size - 1; i >= 0; i--){
					se(i == i_size - 1){
						se(dir == 'W' ou dir == 'S'){
							pos_xa = pos[i][0]
							pos_ya = pos_yt
						}
						senao se(dir == 'A' ou dir == 'D'){
							pos_xa = pos_xt
							pos_ya = pos[i][1]
						}
					}
					senao{
						pos_xt = pos[i][0]
						pos_yt = pos[i][1]
						pos[i][0] = pos_xa
						pos[i][1] = pos_ya
						pos_xa = pos_xt
						pos_ya = pos_yt
					}
				}
			
			
				//Actualiza a posição da maçã depois de ser comida pela cobra
				se(pos_x == pos_xe e pos_y == pos_ye){
	
					pos_xe = u.sorteia(1, 29) * 20
					pos_ye = u.sorteia(1, 19) * 20
	
					para(inteiro i = 0; i < i_size; i++){	
						se(pos[i][0] == pos_xe e pos[i][1] == pos_ye){
							pos_xe = u.sorteia(1, 29) * 20
							pos_ye = u.sorteia(1, 19) * 20
							i = 0
						}
					}
	
					//Incrementa o tamanho da cobra apos comer a maçã
					i_size++
					pos[i_size - 1][0] = pos_x
					pos[i_size - 1][1] = pos_y
	
					se(i_size % 10 == 0){
						se(speed > 4){
							speed--	
						}
						
					}
					
				}
	
				//Acaba o jogo se a cobra atinge a limite horizontal inferior ou superior da janela
				se(pos[i_size - 1][0] < 0 ou pos[i_size - 1][0] > g.largura_janela() - 20){
					u.aguarde(500)
					g.fechar_janela()
				}
				////Acaba o jogo se a cobra atinge os limite vertical inferior ou superior da janela
				senao se(pos[i_size - 1][1] < 0 ou pos[i_size - 1][1] > g.altura_janela() - 20){
					u.aguarde(500)
					g.fechar_janela()
				}
	
				//Cria a imagem da cobra por cada segmento
				g.definir_cor(g.COR_VERDE)
				
				para(inteiro i = 0; i < i_size; i++){
					
					//g.desenhar_elipse(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro)
					g.desenhar_retangulo(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro, verdadeiro)
					//g.desenhar_imagem(pos[i][0], pos[i][1], img_snek)
				}
				
	
				//Cria a imagem da maçã
				//g.desenhar_imagem(pos_xe, pos_ye, img_apple)
				g.definir_cor(g.COR_VERMELHO)
				//g.desenhar_retangulo(pos_xe, pos_ye, dim_x, dim_y, verdadeiro, verdadeiro)
				g.desenhar_elipse(pos_xe, pos_ye, dim_x, dim_y, verdadeiro)
	
				//Desenha as figuras na janela
				g.renderizar()
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6036; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {pause, 15, 9, 5}-{aux, 17, 40, 3};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
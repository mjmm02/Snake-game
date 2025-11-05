programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		const inteiro dim_x = 20, dim_y = 20, LARGURA_JANELA = 600, ALTURA_JANELA = 400
		caracter dir = 'S'
		inteiro img_apple, img_snek, pos[250][2], pos_x = 20, 
			pos_y = 20, pos_xe = 20, pos_ye = 80, aux = 0, 
			i_size = 6, speed = 9, VERDE1 = 0

		//VERDE1 = g.criar_cor(0, 100, 0)
		
		pos_x = u.sorteia(5, LARGURA_JANELA / dim_x - 5) * 20
		pos_y = u.sorteia(5, ALTURA_JANELA / dim_y - 5) * 20

		pos_xe = u.sorteia(1, LARGURA_JANELA / dim_x - 1) * 20
		pos_ye = u.sorteia(1, ALTURA_JANELA / dim_y - 1) * 20

		
		pos[i_size - 1][0] = pos_x
		pos[i_size - 1][1] = pos_y

		//img_apple = g.carregar_imagem("C:\\Users\\Migue\\OneDrive\\Pictures\\pixel-apple.png")
		//img_apple = g.redimensionar_imagem(img_apple, 20, 20, falso)
		
		//img_snek = g.carregar_imagem("C:\\Users\\Migue\\OneDrive\\Pictures\\snake_skin.png")
		//img_snek = g.redimensionar_imagem(img_snek, 20, 20, falso)
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
		//g.entrar_modo_tela_cheia()
		g.definir_titulo_janela("Snake game")
		
		g.renderizar()
		u.aguarde(1000)
		
		enquanto(falso == falso){

			//tecla_press = falso
			aux = 0
			
			g.definir_cor(g.COR_VERDE)
			
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
			}
			enquanto(aux < 10)
			
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
				
				i_size++
				pos[i_size - 1][0] = pos_x
				pos[i_size - 1][1] = pos_y

				se(i_size % 10 == 0){
					se(speed > 4){
						speed--	
					}
					
				}
				
			}

			se(dir == 'W'){
				pos_y = pos_y - 20
				pos[i_size - 1][1] = pos_y
			}
			senao se(dir == 'S'){
				pos_y = pos_y + 20
				pos[i_size - 1][1] = pos_y
			}
			senao se(dir == 'A'){
				pos_x = pos_x - 20
				pos[i_size - 1][0] = pos_x
			}
			senao se(dir == 'D'){
				pos_x = pos_x + 20
				pos[i_size - 1][0] = pos_x
			}

			se(i_size > 1){
				para(inteiro i = 0; i < i_size - 1; i++){
					se(pos[i_size - 1][0] == pos[i][0] e pos[i_size - 1][1] == pos[i][1]){
						u.aguarde(500)
						g.fechar_janela()
					}
				}
				
			}
			
			se(i_size > 1){
				para(inteiro i = 0; i < i_size - 1; i++){
					pos[i][0] = pos[i + 1][0]
					pos[i][1] = pos[i + 1][1]
				}
			}

			se(pos[i_size - 1][0] < 0 ou pos[i_size - 1][0] > g.largura_janela() - 20){
				u.aguarde(500)
				g.fechar_janela()
			}
			senao se(pos[i_size - 1][1] < 0 ou pos[i_size - 1][1] > g.altura_janela() - 20){
				u.aguarde(500)
				g.fechar_janela()
			}

			para(inteiro i = 0; i < i_size; i++){

				se(i == i_size - 1){
					g.definir_cor(g.COR_VERDE)
					//g.desenhar_imagem(pos[i][0], pos[i][1], img_snek)
					g.desenhar_retangulo(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro, verdadeiro)
				}
				//g.desenhar_elipse(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro)
				g.desenhar_retangulo(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro, verdadeiro)
				//g.desenhar_imagem(pos[i][0], pos[i][1], img_snek)
			}

			//g.desenhar_imagem(pos_xe, pos_ye, img_apple)
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(pos_xe, pos_ye, dim_x, dim_y, verdadeiro, verdadeiro)
			//g.desenhar_elipse(pos_xe, pos_ye, dim_x, dim_y, falso)
			
			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3674; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i_size, 13, 3, 6}-{speed, 13, 15, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
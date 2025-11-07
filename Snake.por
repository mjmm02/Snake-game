programa
{
	//Jogo da cobra criado por Miguel Martins

	//Importa as bibliotecas necessárias para as funções usadas no programa
	inclua biblioteca Graficos --> g
	inclua biblioteca Sons --> s
	inclua biblioteca Teclado --> t
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> u
	
	
	funcao inicio()
	{
		//Inicializa as variáveis necessárias para o programa
		const inteiro BLOCO = 30
		caracter dir = 'S'
		cadeia texto_inicial, texto_pausa
		logico pause = falso, game_cycle = falso
		inteiro img_apple, img_snek, img_snek_head, img_snek_head2 = 0, img_snek_straight = 0, 
			img_snek_tail = 0, img_snek_curve1, img_snek_curve2, img_snek_curve3, img_snek_curve4,
			img_gameover, img_gameover2, pos[200][2], pos_x = 0, 
			pos_y = 0, pos_xe = 20, pos_ye = 80, aux = 0, pos_xa = 0, pos_ya = 0,
			i_size = 4, i_inicial = 0, speed = 8, VERDE1 = 0,  pos_xt = 0,
			pos_yt = 0, spause = 0, gameover_sound, death_sound, start_sound, catch_sound, 
			background_music, ALTURA_JANELA, LARGURA_JANELA, COR_VERDE_ESC, n_caracteres, n_ciclos

		//VERDE1 = g.criar_cor(0, 100, 0)
		start_sound = s.carregar_som("Sounds\\game-start-6104.mp3")
		background_music = s.carregar_som("Sounds\\the-return-of-the-8-bit-era-301292.mp3")
		catch_sound = s.carregar_som("Sounds\\blip8bit-293063.mp3")
		death_sound = s.carregar_som("Sounds\\videogame-death-sound-43894.mp3")
		gameover_sound = s.carregar_som("Sounds\\game-over-417465.mp3")

		texto_inicial = "Prima qualquer tecla para iniciar o jogo"
		texto_pausa = "PAUSE"

		i_inicial = i_size
		n_ciclos = 1

		LARGURA_JANELA = BLOCO * 30
		ALTURA_JANELA = BLOCO * 20

		//Posição inicial x e y da cabeça da cobra gerada aleatoriamente
		pos_x = u.sorteia(10, LARGURA_JANELA / BLOCO - 4) * BLOCO
		pos_y = u.sorteia(3, ALTURA_JANELA / BLOCO / 2) * BLOCO

		//Posição inicial x e y da maçã gerada aleatoriamente
		pos_xe = u.sorteia(1, LARGURA_JANELA / BLOCO - 1) * BLOCO
		pos_ye = u.sorteia(1, ALTURA_JANELA / BLOCO - 1) * BLOCO

		//Atribui a posição x e y inicial da cabeça e restantes segmentos do corpo da cobra numa matriz
		pos[i_size - 1][0] = pos_x
		pos[i_size - 1][1] = pos_y
		pos[i_size - 2][0] = pos_x
		pos[i_size - 2][1] = pos_y - BLOCO
		pos[i_size - 3][0] = pos_x
		pos[i_size - 3][1] = pos_y - BLOCO * 2

		//img_apple = g.carregar_imagem("Images\\block_apple.png")
		//img_apple = g.redimensionar_imagem(img_apple, BLOCO, BLOCO, falso)
		
		//img_snek = g.carregar_imagem("Images\\green_block2.png")
		//img_snek = g.redimensionar_imagem(img_snek, BLOCO, BLOCO, falso)

		img_snek_head = g.carregar_imagem("Images\\snek_head.png")
		img_snek_head = g.redimensionar_imagem(img_snek_head, BLOCO, BLOCO, verdadeiro)

		//g.redimensionar_imagem(img_gameover, LARGURA_JANELA, ALTURA_JANELA, verdadeiro)
		
		//Inicia a janela do jogo e define as suas dimensões e título
		COR_VERDE_ESC = g.criar_cor(55, 126, 71)
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
		g.exibir_borda_janela()
		//g.entrar_modo_tela_cheia()
		g.definir_titulo_janela("Snake game")

		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(30.0)
		g.definir_fonte_texto("Megamax Jonathan Too")
		g.desenhar_texto(LARGURA_JANELA / 2 - (g.largura_texto(texto_inicial) / 2), ALTURA_JANELA / 2, texto_inicial)

		g.renderizar()
		
		//s.reproduzir_som(background_music, verdadeiro)
		//Faz um compasso de espera antes do ciclo do jogo iniciar
		//u.aguarde(1000)

		enquanto(game_cycle == falso){
			se(t.alguma_tecla_pressionada() == verdadeiro){
				game_cycle = verdadeiro
			}
			u.aguarde(100)
		}

		u.aguarde(1000)

		//Inicia o ciclo do jogo
		enquanto(game_cycle == verdadeiro){


			//tecla_press = falso
			aux = 0
			
			//Aguarda pelo input do jogador dentro do ciclo e sai ao fim de 10 loops se não houver nenhum input
			faca{
				aux++
				u.aguarde(speed)
				//tecla_press = t.alguma_tecla_pressionada()

				se(pause == falso){
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
				}
				
				se(t.tecla_pressionada(t.TECLA_ESC) == verdadeiro){
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
					pos_y = pos_y - BLOCO
					pos[i_size - 1][1] = pos_y
				}
				senao se(dir == 'S'){
					pos_yt = pos_y
					pos_y = pos_y + BLOCO
					pos[i_size - 1][1] = pos_y
				}
				senao se(dir == 'A'){
					pos_xt = pos_x
					pos_x = pos_x - BLOCO
					pos[i_size - 1][0] = pos_x
				}
				senao se(dir == 'D'){
					pos_xt = pos_x
					pos_x = pos_x + BLOCO
					pos[i_size - 1][0] = pos_x
				}
	
				//Acaba o jogo se a cabeça da cobra atinge um segmento do proprio corpo
				se(i_size > 1){
					para(inteiro i = 0; i < i_size - 1; i++){
						se(pos[i_size - 1][0] == pos[i][0] e pos[i_size - 1][1] == pos[i][1]){
							//u.aguarde(500)
							s.reproduzir_som(death_sound, falso)
							game_cycle = falso
						}
					}
				}

				//Acaba o jogo se a cobra atinge a limite horizontal inferior ou superior da janela
				se(pos[i_size - 1][0] < 0 ou pos[i_size - 1][0] >= LARGURA_JANELA){
					//u.aguarde(500)
					s.reproduzir_som(death_sound, falso)
					game_cycle = falso
				}
				////Acaba o jogo se a cobra atinge os limite vertical inferior ou superior da janela
				senao se(pos[i_size - 1][1] < 0 ou pos[i_size - 1][1] >= ALTURA_JANELA){
					//u.aguarde(500)
					s.reproduzir_som(death_sound, falso)
					game_cycle = falso
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
	
					pos_xe = u.sorteia(1, LARGURA_JANELA / BLOCO - 1) * BLOCO
					pos_ye = u.sorteia(1, ALTURA_JANELA / BLOCO - 1) * BLOCO
	
					para(inteiro i = 0; i < i_size; i++){	
						se(pos[i][0] == pos_xe e pos[i][1] == pos_ye){
							pos_xe = u.sorteia(1, LARGURA_JANELA / BLOCO - 1) * BLOCO
							pos_ye = u.sorteia(1, ALTURA_JANELA / BLOCO - 1) * BLOCO
							i = 0
						}
					}
	
					//Incrementa o tamanho da cobra apos comer a maçã
					i_size++
					pos[i_size - 1][0] = pos_x
					pos[i_size - 1][1] = pos_y

					s.reproduzir_som(catch_sound, falso)

					//Diminui o tempo de intervalo de cada movimento da cobra,aumentando a dificuldade
					/*se(i_size % 10 == 0){
						se(speed > 4){
							speed--	
						}
						
					}*/
					
				}
	
				
			}
				//Cria a imagem da cobra por cada segmento
				se(game_cycle == verdadeiro){
					
					g.definir_cor(COR_VERDE_ESC)
				
					para(inteiro i = 0; i < i_size; i++){
						
						se(i == i_size - 1){
							se(dir == 'W'){
								img_snek_head2 = g.transformar_imagem(img_snek_head, falso, falso, 180, 0)
							}
							senao se(dir == 'S'){
								img_snek_head2 = g.transformar_imagem(img_snek_head, falso, falso, 0, 0)
							}
							senao se(dir == 'A'){
								img_snek_head2 = g.transformar_imagem(img_snek_head, falso, falso, 90, 0)
							}
							senao se(dir == 'D'){
								img_snek_head2 = g.transformar_imagem(img_snek_head, falso, falso, 270, 0)
							}
							g.desenhar_imagem(pos[i][0], pos[i][1], img_snek_head2)
							g.liberar_imagem(img_snek_head2)
						}
						senao{
							//g.desenhar_elipse(pos[i][0], pos[i][1], BLOCO, BLOCO, verdadeiro)
							g.desenhar_retangulo(pos[i][0], pos[i][1], BLOCO, BLOCO, verdadeiro, verdadeiro)
							//g.desenhar_imagem(pos[i][0], pos[i][1], img_snek)
						}	
					}
					
		
					//Cria a imagem da maçã
					//g.desenhar_imagem(pos_xe, pos_ye, img_apple)
					g.definir_cor(g.COR_VERMELHO)
					g.desenhar_retangulo(pos_xe, pos_ye, BLOCO, BLOCO, falso, verdadeiro)
					//g.desenhar_elipse(pos_xe, pos_ye, BLOCO, BLOCO, verdadeiro)
					se(pause == verdadeiro){
						g.definir_cor(g.COR_BRANCO)
						g.desenhar_texto(LARGURA_JANELA / 2 - (g.largura_texto(texto_pausa) / 2), ALTURA_JANELA / 2, texto_pausa)
					}
					//Desenha as figuras na janela
					g.renderizar()

					se(n_ciclos == 1){
						s.reproduzir_som(start_sound, falso)
						u.aguarde(2000)
					}

					

					n_ciclos++
				}
			
			}

			g.limpar()

			s.interromper_som(background_music)
			u.aguarde(2500)

			img_gameover = g.carregar_imagem("Images\\game-over-pixel-background-vector.jpeg")
			//g.definir_dimensoes_janela(g.largura_imagem(img_gameover), g.altura_imagem(img_gameover))
			img_gameover = g.redimensionar_imagem(img_gameover, LARGURA_JANELA, ALTURA_JANELA, verdadeiro)
			g.desenhar_imagem(0, 0, img_gameover)
			
			g.renderizar()

			s.reproduzir_som(gameover_sound, falso)
			
			u.aguarde(3000)
			
			g.encerrar_modo_grafico()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3178; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
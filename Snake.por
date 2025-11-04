programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Matematica --> m
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		caracter dir = 'Z'
		logico tecla_press = falso
		inteiro imagem_pos, num_cor, tecl = t.TECLA_S, ult_tecl = t.TECLA_Z, pos[100][2], pos_x = 20, pos_y = 20, pos_xe = 20, pos_ye = 80, aux = 0, 
				dim_x = 20, dim_y = 20, i_size = 5
		
		pos[i_size - 1][0] = pos_x
		pos[i_size - 1][1] = pos_y
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(600, 400)
		//g.entrar_modo_tela_cheia()
		g.definir_titulo_janela("Snake game")
		//g.definir_cor(g.COR_VERDE)
		//g.desenhar_retangulo(pos_x, pos_y, dim_x, dim_y, verdadeiro, verdadeiro)
		//g.desenhar_elipse(pos_xe, pos_ye, dim_x, dim_y, falso)
		//g.desenhar_imagem(100, 100, imagem_pos)
		g.renderizar()
		
		enquanto(falso == falso){

			tecla_press = falso
			aux = 0
			
			g.definir_cor(g.COR_VERDE)
			
			faca{
				aux++
				u.aguarde(9)
				tecla_press = t.alguma_tecla_pressionada()
			}
			enquanto(tecla_press == falso e aux < 10)
			
			se(tecla_press == verdadeiro){
				ult_tecl = tecl
				tecl = t.ler_tecla()
			}
			
			se(tecl == t.TECLA_W){
				se(ult_tecl != t.TECLA_S){
					dir = 'W'
				}
			}
			senao se(tecl == t.TECLA_S){
				se(ult_tecl != t.TECLA_W){
					dir = 'S'	
				}
			}
			senao se(tecl == t.TECLA_A){
				se(ult_tecl != t.TECLA_D){
					dir = 'A'	
				}
			}
			senao se(tecl == t.TECLA_D){
				se(ult_tecl != t.TECLA_A){
					dir = 'D'
				}
			}
			senao se(tecl == t.TECLA_ESC){
				g.fechar_janela()
			}

			se(pos_x == pos_xe e pos_y == pos_ye){

				para(inteiro i = 0; i < i_size; i++){
					pos_xe = u.sorteia(1, 29) * 20
					pos_ye = u.sorteia(1, 19) * 20

					se(pos[i][0] == pos_xe e pos[i][1] == pos_ye){
						i = 0
					}
				}
				
				i_size++
				pos[i_size - 1][0] = pos_x
				pos[i_size - 1][1] = pos_y
				
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
					senao se(pos[i_size - 1][0] == -20 ou pos[i_size - 1][0] == g.largura_janela() + 20){
						u.aguarde(500)
						g.fechar_janela()
					}
					senao se(pos[i_size - 1][1] == -20 ou pos[i_size - 1][1] == g.altura_janela() + 20){
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

			g.desenhar_elipse(pos_xe, pos_ye, dim_x, dim_y, verdadeiro)

			para(inteiro i = 0; i < i_size; i++){
				
				g.desenhar_retangulo(pos[i][0], pos[i][1], dim_x, dim_y, verdadeiro, verdadeiro)	
			}
			
			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 468; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
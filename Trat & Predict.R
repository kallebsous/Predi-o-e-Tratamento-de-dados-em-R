#Necessário o uso do carsData e do ggplot2
Transact
#Dados sobre o tempo de transação em filiais de um grande banco australiano.

#Utilizaremos o Tipo 2, marcado pela variável "t2", e a variável tempo
edit(Transact)

plot(Transact$t2, Transact$time)#vizualização simples de um plot com os dados

#verificação se há presença de correlação
cor(Transact$t2,Transact$time) 

#criamos um vetor contendo as 2 variáveis e usamos a função 
#lm = "linear model"
#nele vamos encontrar informações para saber se é ou nao linear
#no lm primeiro é a variável Y e depois a X
transact2.reg <- lm(time ~ t2, data = Transact)

summary(transact2.reg)
#no summary conseguimos ler essas informações
#nele podemos ver que o Valor P é significantemente diferente de zero por causa dos "***"
#tambpem podemos ver que há 259 graus de liberade, já que é n-2 = 261-2

#imprime os valores dos coeficientes
coefficients(transact2.reg)

#imprime o grafico de dispersão com a reta de regressão linear

ggplot(Transact, mapping = aes(t2, time)) +
  geom_point() +
  geom_smooth(method = "lm")

#Predicação de um valor que não tem na tabela

#primeiro criamos um novo dado para a predição
#o dado usado vai ser 6000 transações
predt2 <- data.frame(t2 = 6000)

#após criado um novo dado, criamos um vetor utilizando a função predict
#ela recebe o nosso vetor de regressão criado na linha 17
#e recebe tbm o novo dado criado pra predição "predt2"
predicao <- predict(transact2.reg, newdata = predt2)

#após isso, imprimimos o vetor com o valor da função predict
print(predicao)

#o resultado é cerca de 17.171,13 minutos
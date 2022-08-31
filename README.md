
<h1>Alke Parking</h1>

<p> Primeiro projeto Integrador da Segunda Wave do BootCamp de Mobile do MeLi </p>
<p> Projeto de um estacionamento</p>

<h2>Projeto Integrador Swift</h2>

<p>É hora de reunir conhecimentos e colocá-los em prática em um projeto curto; primeiro os requisitos do programa serão explicados de forma geral e depois você avançará progressivamente em cada um deles. Você receberá uma parte do código inicial que deverá completar segundo os exercícios indicados para cumprir os requisitos.<p>
<p>Durante os exercícios você verá algumas mensagens deste tipo; são ajudas que o guiarão nas respostas caso você tenha dúvidas sobre como avançar, lembre também que você pode recorrer ao mentor.</p>

<h3>🅿 AlkeParking 🚘</h3>
<p>AlkeParking é um estacionamento que permite estacionar diversos tipos de veículos (carro, motocicleta, micro-ônibus e ônibus) com capacidade máxima de 20 veículos.</p>
<p> ● Quando um veículo vai entrar no estacionamento a placa e o tipo são inseridos, e é verificado que não haja outro veículo com a mesma placa.</p>
<p> ● Quando um veículo vai ser retirado, é cobrada uma tarifa determinada pelos seguintes regulamentos.</p>
<p> ● As primeiras 2 horas do estacionamento terão um custo fixo determinado pelo tipo de veículo (carro: $20, motocicleta: $15, micro-ônibus: $25, ônibus: $30).</p>
<p> ● Após as primeiras 2 horas, serão cobrados $5 por cada 15 minutos ou fração, independentemente do tipo de veículo. Por exemplo, para um carro, seriam aplicadas as seguintes tarifas:</p>
<table border = "1">
  <tr>
    <td>Entrada</td>
    <td>Saída </td>
    <td>Tarifa </td>
  </tr>
  <tr>
    <td>18:00</td>
    <td>18:46 </td>
    <td>$20 </td>
  </tr>
  <tr>
    <td>18:00</td>
    <td>20:00 </td>
    <td>$20 </td>
  </tr>
  <tr>
    <td>18:00</td>
    <td>21:13 </td>
    <td>$45 </td>
  </tr>
  <tr>
    <td>18:00</td>
    <td>21:18 </td>
    <td>$50 </td>
  </tr>
  <tr>
    <td>18:00</td>
    <td>21:30 </td>
    <td>$50 </td>
  </tr>
</table>

<p> Os veículos podem (opcionalmente) ter um cartão de desconto, o que reduz em 15% a tarifa total do estacionamento.</p>
<p>● Os valores das tarifas não devem incluir centavos; em caso de tê-los devem ser descartados.
 <p>● A pedido da administração do AlkeParking, deve ser mantido um registro do total de veículos retirados do estacionamento, com o total dos ganhos recebidos.
<p>● A administração poderá solicitar a qualquer momento a relação das placas dos veículos que estiverem no estacionamento.

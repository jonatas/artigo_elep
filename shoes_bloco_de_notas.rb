# uma janela com um título "Minhas Notas", tamanho 300 pixels. E dentro desta janela terá:
Shoes.app :title => "Minhas Notas", :width => 300  do 
  # uma linha de edição para escrever a nota
  @anotacao = edit_line

  # um botão para adicionar a anotação que quando for clicado deve:
  button "adicionar anotação" do
    # adicionar o que foi escrito na linha de edição para as notas abaixo listadas
    @notas.append do 
      # a nota e um link para remover a nota
      para( @anotacao.text, " ", link("Apagar nota") {|anotacao| anotacao.parent.remove })
    end
    # limpar o texto da linha de edição da nota
    @anotacao.text = ""
  end

  # uma lista de notas que deve conter
  @notas = stack :margin => 20, :with => 300
end

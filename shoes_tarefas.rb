Shoes.app :title => "Minhas Tarefas", :width => 300 do 
  @anotacao = edit_line
  button "adicionar" do
    @notas.append do 
      para(@anotacao.text, " ", link("apagar") {|item| item.parent.remove })
    end
    @anotacao.text = ""
  end
  @notas = stack :margin => 20, :with => 300
end
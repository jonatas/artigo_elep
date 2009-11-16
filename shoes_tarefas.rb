Shoes.app :title => "Minhas Tarefas", :width => 300 {
  @anotacao = edit_line
  button "adicionar" {
    @notas.append {
      para(@anotacao.text + " " +  
           link("apagar") {|nota| nota.parent.remove })
    } 
    @anotacao.text = ""
  }
  @notas = stack :margin => 20, :width => 300
}

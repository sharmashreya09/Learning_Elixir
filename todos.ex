defmodule Todos do
 
   def create_todos do
    {number_of_tasks,_}=IO.gets("enter no.of tasks you want to add: ")|>Integer.parse()
    
    for _ <- 1..number_of_tasks do
      IO.gets("Enter Task: ")|> String.trim()
    end
   end

   def temp_todos do
     ["eat apple","readbook","elixirseries","exercise"]
  end
  def complete_todo(tasks,task) do
     if contains?(tasks,task)do
        List.delete(tasks,task)
     else    
         :not_found_error
     end
  end
  def add_new_todo(tasks,task)do
     List.insert_at(tasks,-1,task)
  end
  def contains?(tasks,task)do
     Enum.member?(tasks,task)
  end
  def keyword_search(tasks,word)do
   for task<-tasks,String.contains?(task,word) do
    task
  end
  end
  def random_task(tasks)do
    [task]=Enum.take_random(tasks,1)
    task
  end
  def save(tasks,filename)do
     #envoking erlang code so that it could be written to our file system
    binary= :erlang.term_to_binary(tasks)
    File.write(filename,binary)
  end
  def read(filename)do
     case File.read(filename) do
         {:ok,binary} -> :erlang.binary_to_term(binary)
         {:error,_reason} ->"File doesn't exist"
     end
    #{_status,binary}=File.read(filename)
    #:erlang.binary_to_term(binary)
  end
end

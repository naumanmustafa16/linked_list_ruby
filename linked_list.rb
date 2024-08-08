require_relative 'node'

class LinkedList
  attr_accessor :first_node  
  
  def initialize(first_node)
    @first_node =first_node
  end

  #1 append(value) adds a new node containing value to the end of the list
  
  def append(value)
        
    #creat a new node
    new_last_node = Node.new(value)

    # Access the last node
    current_node = first_node
    index = 0
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    # Make new_last_node the next_node of the current_last value
    current_node.next_node = new_last_node
  end 

  #2 prepend(value) adds a new node containing value to the start of the list
  
  def prepend(value)
    my_new_first_node = Node.new(value)
    #current frst_node will be the next_node for the my_new_first_node
    my_new_first_node.next_node = first_node
    #declare that now list has my_new_first_node as first_node
    self.first_node = my_new_first_node
  end

  #3 size returns the total number of nodes in the list
  
  def size
    current_node = first_node
    count = 0
    until current_node.next_node == nil
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  #4 head returns the first node in the list
  
  def head
    current_node = first_node
    current_node
  end

  #5 tail returns the last node in the list
  
  def tail
    current_node = first_node
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node
  end

  #6 at(index) returns the node at the given index
  
  def at(index)
    current_node = first_node
    current_index = 0

    until current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end
  #7 pop removes the last element from the list
  def pop
    
    # current_node = self.tail
    index_of_2nd_last_node = self.size - 1
    index = 0
    current_node = first_node
    until index == index_of_2nd_last_node
            current_node = current_node.next_node
            index += 1
    end 
    current_node.next_node = nil
    self
  end

  #8- contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = first_node
    current_index = 0
    last_index = self.size
    until current_index > last_index
      if current_node.data == value
        return true
        break
      end

        current_node = current_node.next_node
        current_index += 1
     end
    return false
  end

  #9- find(value) returns the index of the node containing value, or nil if not found.

  def find(value)
    current_node = first_node
    current_index = 0
    last_index = self.size
    until current_index > last_index
      if current_node.data == value
        return current_index
        break
      end

        current_node = current_node.next_node
        current_index += 1
     end
    return nil

  end

  #10 to_s represent your LinkedList objects as strings, 
  #so you can print them out and preview them in the console. 
  #The format should be: ( value ) -> ( value ) -> ( value ) -> nil

  def to_s
    current_node = first_node
    current_index = 0
    last_index = self.size
    list_string = ''
    until current_index > last_index
      list_string = list_string + "(#{current_node.data}) -> "
      current_node = current_node.next_node
      current_index += 1
    end
    return list_string + "nil"
  end
end

node_1 = Node.new("I")
node_2 = Node.new("am")
node_3 = Node.new("your")
node_4 = Node.new("Friend")

node_1.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4

linked_list_1 = LinkedList.new(node_1)
#  p linked_list_1

#  linked_list_1.append("best")

# p linked_list_1

# linked_list_1.prepend("All")
# p linked_list_1

# p linked_list_1.size
# p linked_list_1.head
# p linked_list_1.tail
# p linked_list_1.at(3)
# p linked_list_1.pop
# p linked_list_1.head.data
# p linked_list_1.find("your")
p linked_list_1.to_s
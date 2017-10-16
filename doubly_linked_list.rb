# Create .rb file and define the Linked List and Node classes keeping object oriented principles in mind. Author methods to:
      # add a value
      # search for a value
      # count the number of entries
      #and delete a value from the linked list
#, assuming that the values in each nodes are integers. Be mindful of when the linked list is empty (before adding the first node, after deleting the last node etc.) in your methods.
# Do the above for a singly linked list and a separate file for a doubly linked list.

class Node
  attr_reader :node
  attr_accessor :next, :previous
  def initialize(value)
    @node = value
    @next = nil
    @previous = nil
  end # initialize
end # Node

class LinkedList
  def initialize
    @head = nil
  end # initialize

  def add_node(node_data)
    # Create a new node with the value to be added
    # new_node's next is set to nil
    new_node = Node.new(node_data)

    # if head is nil then you can just set @head to new node
    if @head == nil
      @head = new_node
      return
    end

    # Update new_node's next to be @head
    # set @head to new_node
    # Update @heads previous to be the new node

    new_node.next = @head
    @head = new_node
    @head.next.previous = new_node
    return
  end # add_node

  def count_number_of_nodes
    # if @head is nil then the LinkedList is empty
    if @head == nil
      return 0
    end

    current = @head
    count = 0

    # while current is not nil, increment count and update current to be current's next
    while current != nil
      count += 1
      current = current.next
    end
    # return the number of nodes in the LinkedList
    return count
  end # count_number_of_nodes

  def search_for_node(integer)
    # if @head is nil then the LinkedList is empty and does not contain the node you're looking for
    if @head == nil
      return false
    end

    current = @head

    # While current is not equal to nil check each value of each node in the LinkedList to see if it matches the integer you are looking for. If it does, then return true.
    while current != nil
      if current.node == integer
        return true
      end
      current = current.next
    end
    # If no node's value matches the integer, return false
    return false
  end # search_for_node

  def delete_node(integer)
    # return right away if the LinkedList is empty
    return if @head == nil

    if @head.node == integer
      @head = @head.next
      @head.previous = nil
      return
    end # if

    current = @head
    while current.next != nil
      if current.next.node == integer
        current.next = current.next.next
        current.next.previous = current
        return
      end # if
      current = current.next
    end
  end # delete_node

  
end # LinkedList

##################### TESTING CODE ##############################
l = LinkedList.new
l.add_node(4)
num = l.count_number_of_nodes
puts num
l.add_node(10)
l.add_node(15)
l.add_node(1)
num_2 = l.count_number_of_nodes
puts num_2


result_1 = l.search_for_node(10)
puts result_1
result_2 = l.search_for_node(15)
puts result_2
result_3 = l.search_for_node(4)
puts result_3
result_4 = l.search_for_node(50)
puts result_4

l.delete_node(10)
puts l.count_number_of_nodes
puts l.search_for_node(10)
puts l.search_for_node(1)
l.delete_node(1)
puts l.count_number_of_nodes
puts l.search_for_node(4)
puts l.search_for_node(1)

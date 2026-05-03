# Godot_Data_Arborist
SE2 Final Project
Overview
Data Arborist is an interactive, educational puzzle game designed to gamify complex computer science
concepts. Players manipulate and organize data structures through a drag-and-drop interface to solve 
logic puzzles, making object-oriented architecture and node relationships highly visual.

Core Gameplay Mechanics
Drag-and-Drop Sorting: Players are presented with a randomized binary tree and must physically drag 
and drop nodes to sort them into the correct, valid configuration.

Data Structures as Puzzles: Levels strictly revolve around the specific rules and sorting logic of 
binary search trees and binary heaps.

Algorithmic Validation: To clear a level, the player's final node arrangement must pass the strict 
validation rules of the target data structure.

System Architecture (OOP Implementation)
To support the core gameplay and maintain a clean, modular codebase, Data Arborist utilizes strict 
Object-Oriented Programming principles. Below is the breakdown of the program's structure.

UML Diagram
classDiagram
	class AbstractPuzzleStructure {
		<<abstract>>
		- int puzzleID
		- boolean isSorted
		- int moveCount
		+ getPuzzleID() int
		+ setPuzzleID(int)
		+ getIsSorted() boolean
		+ setIsSorted(boolean)
		+ getMoveCount() int
		+ setMoveCount(int)
		+ validateStructure()* boolean
	}

	class BinarySearchTree {
		- Node rootNode
		+ getRootNode() Node
		+ setRootNode(Node)
		+ validateStructure() boolean
	}

	class BinaryHeap {
		- Node[] heapArray
		+ getHeapArray() Node[]
		+ setHeapArray(Node[])
		+ validateStructure() boolean
	}

	class StrictBST {
		- boolean allowDuplicates
		+ validateStructure() boolean
	}

	class RelaxedBST {
		- int toleranceLevel
		+ validateStructure() boolean
	}

	class MinHeap {
		- boolean isZeroIndexed
		+ validateStructure() boolean
	}

	class MaxHeap {
		- boolean isZeroIndexed
		+ validateStructure() boolean
	}

	AbstractPuzzleStructure <|-- BinarySearchTree
	AbstractPuzzleStructure <|-- BinaryHeap
	BinarySearchTree <|-- StrictBST
	BinarySearchTree <|-- RelaxedBST
	BinaryHeap <|-- MinHeap
	BinaryHeap <|-- MaxHeap


OOP Requirements Checklist
Abstract Class (AbstractPuzzleStructure):
Serves as the foundational blueprint for all puzzles in the game. It contains common attributes 
shared by every puzzle (like the puzzleID, isSorted status, and moveCount) and defines the abstract 
method validateStructure() that all specific puzzles must implement.

Inheritance (Parent Classes):

BinarySearchTree: Inherits from AbstractPuzzleStructure. Represents puzzles where nodes must be 
sorted sequentially (left child < parent < right child).

BinaryHeap: Inherits from AbstractPuzzleStructure. Represents puzzles where nodes are sorted by 
hierarchical weight (parent > children or parent < children).

Inheritance (Child Classes):

Children of BinarySearchTree:

StrictBST: A classic puzzle level where no duplicate node values are allowed.

RelaxedBST: A puzzle level that allows duplicate values (placing them specifically to the right or 
left).

Children of BinaryHeap:

MinHeap: A puzzle level where the parent node must always be smaller than its children.

MaxHeap: A puzzle level where the parent node must always be larger than its children.

Encapsulation:
All class attributes (e.g., puzzleID, isSorted, rootNode, heapArray) are marked as private 
(- in UML). They cannot be accessed directly by the game engine or UI. Instead, they are modified 
and retrieved strictly through public getters and setters (+ in UML).

Polymorphism:
The abstract method validateStructure() is overridden across the hierarchy.

The BinarySearchTree overrides it to check left-to-right sorting rules.

The BinaryHeap overrides it to check top-to-bottom array math rules.

The child classes (MinHeap, MaxHeap, etc.) override it again to enforce their specific win-state 
conditions (e.g., MinHeap specifically checks if parent < child, returning true only if the player 
dragged the nodes into a valid Min-Heap configuration).

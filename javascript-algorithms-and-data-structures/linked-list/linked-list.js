const LinedListNode = require("./linked-list-node");
const Comparator = require("../utils/comparator");

module.export = class {
	constructor(comparatorFunction) {
		this.head = null;
		this.tail = null;
		this.compare = new Comparator(comparatorFunction);
	}

	prepend(value) {
		const newNode = new LinedListNode(value, this.head);
		this.head = newNode;

		if (!this.tail) {
			this.tail = newNode;
		}

		return this;
	}

	append(value) {
		const newNode = new LinedListNode(value);

		if (!this.head) {
			this.head = newNode;
			this.tail = newNode;

			return this;
		}

		this.tail.next = newNode;
		this.tail = newNode;

		return this;
	}

	delete(value) {
		if (!this.head) {
			return null;
		}

		let deleteNode = null;

		while (this.head && this.compare.equal(this.head.value, value)) {
			deleteNode = this.head;
			this.head = this.head.next;
		}

		let currentNode = this.head;

		if (currentNode !== null) {
			while (currentNode.next) {
				if (this.compare.equal(currentNode.next.value, value)) {
					deleteNode = currentNode.next;
					currentNode.next = currentNode.next.next;
				} else {
					currentNode = currentNode.next;
				}
			}
		}

		if (this.compare.equal(this.tail, value)) {
			this.tail = currentNode;
		}

		return deleteNode;
	}

	find({ value, callback }) {
		if (!this.head) {
			return null;
		}

		let currentNode = this.head;

		while (currentNode) {
			if (callback && callback(currentNode.value)) {
				return currentNode;
			}

			if (value !== undefined && this.compare.equal(currentNode.value, value)) {
				return currentNode;
			}

			currentNode = currentNode.next;
		}

		return null;
	}

	deleteTail() {
		const deletedTail = this.tail;

		if (this.head === this.tail) {
			this.head = null;
			this.tail = null;

			return this.deletedTail;
		}

		let currentNode = this.head;
		while (currentNode.next) {
			if (currentNode.next.next) {
				currentNode = currentNode.next;
			} else {
				currentNode.next = null;
			}
		}

		this.tail = currentNode;

		return deletedTail;
	}

	deleteHead() {
		if (!this.head) {
			return null;
		}

		const deletedHead = this.head;

		if (this.head.next) {
			this.head = this.head.next;
		} else {
			this.head = null;
			this.tail = null;
		}

		return deletedHead;
	}

	fromArray(values) {
		values.forEach(value => this.append(value));

		return this;
	}

	toArray() {
		const nodes = [];

		let currentNode = this.head;
		while (currentNode) {
			nodes.push(currentNode);
			currentNode = currentNode.next;
		}

		return nodes;
	}

	toString(callback) {
		return this.toArray().map(node => node.toString(callback)).toString();
	}

	reverse() {
		let currNode = this.head;
		let prevNode = null;
		let nextNode = null;

		while (currNode) {
			nextNode = currNode.next;

			currNode.next = prevNode;

			prevNode = currNode;
			currNode = nextNode;
		}

		this.tail = this.head;
		this.head = prevNode;

		return this;
	}
};

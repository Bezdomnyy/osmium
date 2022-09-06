//
// Created by os on 9/6/22.
//

#ifndef OSMIUM_LIST_H
#define OSMIUM_LIST_H


template <typename T>
class List {
private:
    struct Node {
        T *data;
        Node *next;

        Node(T *data, Node *next) : data(data), next(next) {}
    };

    Node *head, *tail;
public:
    List() : head(0), tail(0) {}
    List(const List<T> &) = delete;
    //List(List<T> &&) = delete;
    List<T> &operator=(const List<T> &) = delete;

    void putFirst(T *data) {
        Node *newNode = new Node(data, head);
        head = newNode;
        if (!tail) tail = head;
    }

    void putLast(T *data) {
        Node *newNode = new Node(data, 0);
        if (!tail) head = tail = newNode;
        else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    T* takeFirst() {
        if (!head) return 0;

        T* ret = head->data;
        Node* old = head;
        head = head->next;
        if (!head) tail = 0;
        delete old;

        return ret;
    }

    T* takeLast() {
        if (!head) return 0;

        Node* curr = head, *prev = 0;
        while (curr->next) prev = curr, curr = curr->next;

        if(prev) prev->next = 0;
        else head = 0;
        tail = prev;
        T* ret = curr->data;

        return ret;
    }

    T* getFirst() {
        if(!head) return 0;
        return head->data;
    }
    T* getLast() {
        if (!tail) return 0;
        return tail->data;
    }

    ~List() = default; /*{
        while (head) {
            Node *old = head;
            head = head->next;
            delete old;
        }

        tail = 0;
    }*/
};


#endif //OSMIUM_LIST_H


#define MIN_HEAP_DEFAULT_CAPACITY 64

#define HEAP_PARENT(npos) ((int)(((npos)-1)/2))  /*npos的父结点*/
#define HEAP_LEFT(npos) (((npos)*2)+1)           /*npos的左兄弟结点*/
#define HEAP_RIGHT(npos) (((npos)*2)+2)          /*npos的右兄弟结点*/

#define SWAP(a,b) int swap_a_b = a; a = b; b = swap_a_b;

typedef struct SHeap{
	int* data;
	int size;
	int capacity;

	int (*pop)(struct SHeap* heap, int* val);
	int (*push)(struct SHeap* heap, int val);
	int (*resize)(struct SHeap* heap);
	void (*dump)(struct SHeap* heap);
	void (*order)(struct SHeap* heap);
}Heap;

void Heap_resize(Heap* heap) {
	if (heap->size >= heap->capacity)  {
		heap->capacity = 2 * heap->capacity;

		int* d = (int*)malloc(sizeof(int) * heap->capacity);
		memcpy(d, heap->data, sizeof(int) * heap->capacity / 2);
		free(heap->data);
		heap->data = d;

	}
}

void MaxHeap_push(Heap* heap, int val) {
	if (heap->size >= heap->capacity) {
		heap->resize(heap);
	}
	int position = heap->size++;
	heap->data[position] = val;
	while (1) {
		int father = HEAP_PARENT(position);
		if (heap->data[father] >= heap->data[position]) {
			break;
		} else {
			SWAP(heap->data[father], heap->data[position]);
			position = father;
		}
	}
}

int MaxHeap_pop(Heap* heap, int* val) {
	if (heap->size == 0) {
		return -1;
	}
	
	*val = heap->data[0];
	SWAP(heap->data[0], heap->data[heap->size - 1]);
	heap->size--;
	if (heap->size <= 1) {
		return 0;
	}

	int position = 0;
	while (1) {
		int lp = HEAP_LEFT(position);
		int rp = HEAP_RIGHT(position);
		if (lp >= heap->size) {
			break;
		}
		else if (rp >= heap->size ) {
			if (heap->data[position] >= heap->data[lp]) {
				break;
			}
			int swap_child = lp;
			SWAP(heap->data[position], heap->data[swap_child]);
			position = swap_child;
		} else {
			if (heap->data[position] >= heap->data[lp] && heap->data[position] >= heap->data[rp]) {
				break;
			}
			int swap_child = heap->data[lp] >= heap->data[rp] ? lp : rp;
			SWAP(heap->data[position], heap->data[swap_child]);
			position = swap_child;
		}
	}
	return 0;
}

void MinHeap_push(Heap* heap, int val) {
	if (heap->size >= heap->capacity) {
		heap->resize(heap);
	}
	int position = heap->size++;
	heap->data[position] = val;
	while (1) {
		int father = HEAP_PARENT(position);
		if (heap->data[father] <= heap->data[position]) {
			break;
		} else {
			SWAP(heap->data[father], heap->data[position]);
			position = father;
		}
	}
}

int MinHeap_pop(Heap* heap, int* val) {
	if (heap->size == 0) {
		return -1;
	}
	
	*val = heap->data[0];
	SWAP(heap->data[0], heap->data[heap->size - 1]);
	heap->size--;
	if (heap->size <= 1) {
		return 0;
	}

	int position = 0;
	while (1) {
		int lp = HEAP_LEFT(position);
		int rp = HEAP_RIGHT(position);
		if (lp >= heap->size) {
			break;
		}
		else if (rp >= heap->size ) {
			if (heap->data[position] <= heap->data[lp]) {
				break;
			}
			int swap_child = lp;
			SWAP(heap->data[position], heap->data[swap_child]);
			position = swap_child;
		} else {
			if (heap->data[position] <= heap->data[lp] && heap->data[position] <= heap->data[rp]) {
				break;
			}
			int swap_child = heap->data[lp] <= heap->data[rp] ? lp : rp;
			SWAP(heap->data[position], heap->data[swap_child]);
			position = swap_child;
		}
	}
	return 0;
}

void Heap_dump(Heap* heap) {
	printf("heap ");
	for (int i = 0; i < heap->size; i++) {
		printf("%d ", heap->data[i]);
	}
	printf("\n");
}

Heap* MaxHeap_create() {
	Heap* heap = (Heap*)malloc(sizeof(Heap));
	if (heap) {
		heap->data = (int*)malloc(sizeof(int) * MIN_HEAP_DEFAULT_CAPACITY);
		heap->capacity = MIN_HEAP_DEFAULT_CAPACITY;
		heap->size = 0;

		heap->push = MaxHeap_push;
		heap->pop = MaxHeap_pop;
		heap->dump = Heap_dump;
		heap->resize = Heap_resize;
	} 
	return heap;
}

Heap* MinHeap_create() {
	Heap* heap = (Heap*)malloc(sizeof(Heap));
	if (heap) {
		heap->data = (int*)malloc(sizeof(int) * MIN_HEAP_DEFAULT_CAPACITY);
		heap->capacity = MIN_HEAP_DEFAULT_CAPACITY;
		heap->size = 0;

		heap->push = MinHeap_push;
		heap->pop = MinHeap_pop;
		heap->dump = Heap_dump;
		heap->resize = Heap_resize;
	} 
	return heap;
}

void Heap_destroy(Heap* heap) {
	if (heap) {
		free(heap->data);
		free(heap);
	}
}


int main() {
	Heap* heap = MaxHeap_create();
	for (int i = 0; i < 2048 ; i++) {
		heap->push(heap, i);	
	}
	heap->dump(heap);
	for (int i = 0; i < 2048; i++) {
		int val = 0;
		if (heap->pop(heap, &val) == 0) {
			printf("pop %d\n", val);	
		} else {
			printf("pop fail\n");
		}
 	}

 	heap = MinHeap_create();
	for (int i = 2048 - 1; i >= 0; i--) {
		heap->push(heap, i);	
	}
	heap->dump(heap);
	for (int i = 0; i < 2048; i++) {
		int val = 0;
		if (heap->pop(heap,&val) == 0) {
			printf("pop %d\n", val);	
		} else {
			printf("pop fail\n");
		}
 	}
}
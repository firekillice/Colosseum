

#define MIN_VECTOR_DEFAULT_CAPACITY 64
typedef int TVecValue;

typedef struct SVector{
	TVecValue* data;
	int size;
	int	capacity; 

	void (*resize)(struct SVector* vec);
	void (*push_back)(struct SVector* vec, int TVecValue);
	int (*pop_back)(struct SVector* vec, int* TVecValue);
}Vector;


void vector_resize(Vector* vec) {
	if (vec->size >= vec->capacity)  {
		vec->capacity = 2 * vec->capacity;

		TVecValue* d = (TVecValue*)malloc(sizeof(TVecValue) * vec->capacity);
		memcpy(d, vec->data, sizeof(TVecValue) * vec->capacity / 2);
		free(vec->data);
		vec->data = d;
	}
}

void vector_push_back(Vector* vec, TVecValue val) {
	if (vec->size >= vec->capacity) {
		vec->resize(vec);
	}
	int position = vec->size++;
	vec->data[position] = val;
}

int vector_pop_back(Vector* vec, TVecValue* val) {
	if (vec->size <= 0) {
		return -1;
	}
	*val = vec->data[vec->size-- - 1];
	return 0;
}

Vector* vector_create() {
	Vector* vec = (Vector*)malloc(sizeof(Vector));
	if (vec) {
		vec->data = (TVecValue*)malloc(sizeof(TVecValue) * MIN_VECTOR_DEFAULT_CAPACITY);
		vec->capacity = MIN_VECTOR_DEFAULT_CAPACITY;
		vec->size = 0;

		vec->push_back = vector_push_back;
		vec->pop_back = vector_pop_back;
		vec->resize = vector_resize;
	} 
	return vec;
}

void vector_destroy(Vector* vec) {
	if (vec) {
		free(vec->data);
		free(vec);
	}
}


int main() {
	Vector* vec = vector_create();
	for (int i = 0; i < 2048 ; i++) {
		vec->push_back(vec, i);	
	}
	for (int i = 0; i < 2048; i++) {
		int val = 0;
		if (vec->pop_back(vec, &val) == 0) {
			printf("pop %d\n", val);	
		} else {
			printf("pop fail\n");
		}
 	}
 }
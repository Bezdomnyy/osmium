//
// Created by os on 8/10/22.
//

#ifndef OSMIUM_SYSCALL_C_H
#define OSMIUM_SYSCALL_C_H

#include "../lib/hw.h"
//using size_t = decltype(sizeof(0));

//0x01
extern "C" void *mem_alloc(size_t size);
/* Alocira (najmanje) size bajtova memorije, zaokruženo
 * i poravnato na blokove veličine MEM_BLOCK_SIZE.
 * Vraća pokazivač na alocirani deo memorije u slučaju uspeha,
 * a null pokazivač u slučaju neuspeha.
 *
 * MEM_BLOCK_SIZE je celobrojna konstanta veća od ili jednaka 64,
 * a manja od ili jednaka 1024.
 */


//0x02
extern "C" int mem_free(void *);
/* Oslobađa prostor prethodno zauzet pomoću mem_alloc.
 * Vraća 0 u slučaju uspeha, negativnu vrednost u slučaju greške (kôd greške).
 * Argument mora imati vrednost vraćenu iz mem_alloc.
 * Ukoliko to nije slučaj, ponašanje je nedefinisano:
 * jezgro može vratiti grešku ukoliko može da je detektuje ili
 * manifestovati bilo kakvo drugo predvidivo ili nepredvidivo ponašanje.
 */


//0x11
class _thread;
typedef _thread *thread_t;

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);
/* Pokreće nit nad funkcijom start_routine, pozivajući je sa argumentom arg.
 * U slučaju uspeha, u *handle upisuje „ručku“ novokreirane niti i vraća 0,
 * a u slučaju neuspeha vraća negativnu vrednost (kôd greške).
 *
 * „Ručka“ je interni identifikator koji jezgro koristi da bi identifikovalo nit
 * (pokazivač na neku internu strukturu/objekat jezgra čije je ime sakriveno iza sinonima _thread).
 */


//0x12
int thread_exit();
/* Gasi tekuću nit. U slučaju neuspeha vraća negativnu vrednost (kôd greške). */


//0x13
void thread_dispatch();
/* Potencijalno oduzima procesor tekućoj i daje nekoj drugoj (ili istoj) niti. */


//0x21
class _sem;
typedef _sem *sem_t;

int sem_open(
        sem_t *handle,
        unsigned init
);

/* Kreira semafor sa inicijalnom vrednošću init.
 * U slučaju uspeha, u *handle upisuje ručku novokreiranog semafora i vraća 0,
 * a u slučaju neuspeha vraća negativnu vrednost (kôd greške).
 * „Ručka“ je interni identifikator koji jezgro koristi da bi identifikovalo semafore
 * (pokazivač na neku internu strukturu / objekat jezgra čije je ime sakriveno iza sinonima _sem).
 */

//0x22
int sem_close(sem_t handle);
/* Oslobađa semafor sa datom ručkom. Sve niti koje su se zatekle da čekaju na semaforu
 * se deblokiraju, pri čemu njihov wait vraća grešku. U slučaju uspeha vraća 0,
 * a u slučaju neuspeha vraća negativnu vrednost (kôd greške).
 */

//0x23
int sem_wait(sem_t id);
/* Operacija wait na semaforu sa datom ručkom.
 * U slučaju uspeha vraća 0, a u slučaju neuspeha,
 * uključujući i slučaj kada jesemafor dealociran dok je pozivajuća nit na njemu čekala,
 * vraća negativnu vrednost (kôd greške).
 */


//0x24
int sem_signal(sem_t id);
/* Operacija signal na semaforu sa datom ručkom.
 * U slučaju uspeha vraća 0, a u slučaju neuspeha vraća negativnu vrednost (kôd greške).
 */


//0x31
typedef unsigned long time_t;

int time_sleep(time_t);
/* Uspavljuje pozivajuću nit na zadati period u internim jedinicama vremena (periodama tajmera).
 * U slučaju uspeha vraća 0, a u slučaju neuspeha vraća negativnu vrednost (kôd greške).
 */


//0x41
const int EOF = -1;

char getc();
/* Učitava jedan znak iz bafera znakova učitanih sa konzole.
 * U slučaju da je bafer prazan, suspenduje pozivajuću nit dok se znak ne pojavi.
 * Vraća učitani znak u slučaju uspeha, a konstantu EOF u slučaju greške.
 */


//0x42
void putc(char);
/* Ispisuje dati znak na konzolu. */


#endif //OSMIUM_SYSCALL_C_H

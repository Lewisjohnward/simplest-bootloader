#define MULTIPLIER(seconds) seconds * 100000000

void wait(int seconds){
  long i = MULTIPLIER(seconds);
  for (long j = 0 ;j < i; j++){}
}

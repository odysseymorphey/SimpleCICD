// Created by Loewetha 04.08.2022
#include <getopt.h>
#include <stdio.h>
#include <string.h>

typedef struct {
  int b;
  int e;
  int v;
  int n;
  int s;
  int t;
} flags;

int parser(int argc, char *argv[], flags *flg);
int reader(char *argv[], flags *flg);

int main(int argc, char *argv[]) {
  flags flg = {0};
  int exit = 0;
  exit = parser(argc, argv, &flg);

  while (optind < argc) {
    exit = reader(argv, &flg);
    optind++;
  }

  return exit;
}

int parser(int argc, char *argv[], flags *flg) {
  int exit = 0;
  int calculate;
  int index = 0;
  static struct option long_option[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };
  while ((calculate = getopt_long(argc, argv, "+bEnsTvet", long_option,
                                  &index)) != -1) {
    switch (calculate) {
      case 'b':
        flg->b = 1;
        break;
      case 'n':
        flg->n = 1;
        break;
      case 's':
        flg->s = 1;
        break;
      case 'e':
        flg->e = 1;
        flg->v = 1;
        break;
      case 't':
        flg->t = 1;
        flg->v = 1;
        break;
      case 'v':
        flg->v = 1;
        break;
      case 'E':
        flg->e = 1;
        break;
      case 'T':
        flg->t = 1;
        break;
      default:
        fprintf(stderr, "usage: cat [-benstuv] [ptr ...]");
        exit = 1;
        break;
    }
  }
  return exit;
}

int reader(char *argv[], flags *flg) {
  FILE *ptr;
  int exit = 0;

  ptr = fopen(argv[optind], "r");

  if (ptr != NULL) {
    int calculate = 1;
    int empty = 0;
    int prev = '\n';
    int step;

    while ((step = fgetc(ptr)) != EOF) {
      if (flg->b && flg->n) {
        flg->n = 0;
      }
      if (flg->s && step == '\n' && prev == '\n') {
        empty++;
        if (empty > 1) {
          continue;
        }
      } else {
        empty = 0;
      }
      if (flg->n && prev == '\n') {
        printf("%6d\t", calculate++);
      }
      if (flg->b && step != '\n' && prev == '\n') {
        printf("%6d\t", calculate++);
      }
      if (flg->t && step == '\t') {
        printf("^");
        step = 'I';
      }
      if (flg->e && step == '\n') {
        printf("$");
      }
      if (flg->v) {
        if ((step >= 0 && step < 9) || (step > 10 && step < 32) ||
            step == 127) {
          if (step == 127) {
            printf("^?");
            prev = step;
            continue;
          } else {
            printf("^");
            step += 64;
          }
        }
      }
      printf("%c", step);
      prev = step;
    }
    fclose(ptr);
  } else {
    exit = -1;
  }
  return exit;
}

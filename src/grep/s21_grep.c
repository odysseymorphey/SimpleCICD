#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

struct flags {
  int e, i, v, c, l, n;
};

int parsing(int argc, char *argv[], struct flags *flag, char *pattern);
void grep(struct flags *flag, int argc, char **argv, char *temp);

int main(int argc, char *argv[]) {
  struct flags flag = {};
  int exit = 0;
  char pattern[1024] = {'\0'};
  exit = parsing(argc, argv, &flag, pattern);
  if ((argc >= 3) && exit != 1) {
    grep(&flag, argc, argv, pattern);
  }
  return exit;
}

int parsing(int argc, char *argv[], struct flags *flag, char *pattern) {
  int i = 0, result = 0;
  char temp[2056] = {'\0'};
  while ((i = getopt_long(argc, argv, "e:ivcln", 0, 0)) != -1) {
    switch (i) {
      case 'e':
        strcpy(temp, pattern);
        flag->e = 1;
        sprintf(pattern, "%s%s%s", temp, *pattern == '\0' ? "\0" : "|", optarg);
        break;
      case 'i':
        flag->i = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'c':
        flag->c = 1;
        break;
      case 'l':
        flag->l = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      default:
        fprintf(stderr, "usage: grep");
        result = 1;
        break;
    }
  }
  return result;
}

void grep(struct flags *flag, int argc, char **argv, char *temp) {
  char mass[1024] = {0};
  char *filename[1024] = {'\0'};

  if (flag != NULL && !flag->e) {
    sprintf(mass, "%s", argv[optind++]);
  }
  if (flag != NULL && flag->e) {
    sprintf(mass, "%s", temp);
  }

  for (int i = optind, countFile = 0; i < argc; i++, countFile++) {
    filename[countFile] = &argv[i][0];
  }
  for (int i = 0; filename[i]; i++) {
  }
  int fl1 = 0;
  for (int i = optind; i < argc; i++) {
    regex_t reg;
    FILE *fp;
    fp = fopen(argv[i], "r");
    if (fp == NULL) {
    } else {
      regcomp(&reg, mass,
              (flag != NULL && flag->i == 1) ? REG_ICASE | REG_EXTENDED
                                             : REG_EXTENDED);
      char text[1024] = {0};
      regmatch_t pmatch[1];
      int matches = 0, step = 1;
      while (fgets(text, 1024, fp) != NULL) {
        int status = regexec(&reg, text, 1, pmatch, 0);
        int match = 0;
        if (!status && flag->v == 0) match = 1;
        if (status == REG_NOMATCH && flag->v) match = 1;
        if (match && !flag->l && !flag->c && !flag->n && !flag) {
          printf("%d:", step);
        }
        if (match && !flag->l && !flag->c) {
          if (filename[1] != NULL) {
            printf("%s:", filename[fl1]);
            if (flag->n) printf("%d:", step);
          }
          if (flag->n && !flag->v) printf("%d:", step);
          printf("%s", text);
        }
        matches += match;
        step++;
        if (strchr(text, '\n') == NULL && !feof(fp)) printf("\n");
      }

      if (flag->l && flag->c) {
        if (filename[1] != NULL) {
          printf("%s:", filename[fl1]);
          if (matches > 0) {
            printf("%d", 1);
          } else {
            printf("%d", matches);
          }
          printf("\n");
        }
      }
      if (flag->l && matches > 0) printf("%s\n", argv[i]);
      if (flag->c && !flag->l) {
        if (filename[1] != NULL) printf("%s:", filename[fl1]);
        printf("%d\n", matches);
      }
      regfree(&reg);
      fclose(fp);
    }
    fl1++;
  }
}

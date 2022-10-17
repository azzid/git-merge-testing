### What?
Git merging and pushing is hard for beginners as the distributed nature of git is non-trivial to internalize.

This script sets up a repo with a few base commits and multiple clones with new commits simulating separate users.

A new user can generate this test bed to experiment with fetchin/pulling/merging/rebasing and such.
### Installation
```
user@host:~/git$ git clone git@github.com:azzid/git-merge-testing.git
Cloning into 'git-merge-testing'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
Receiving objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
user@host:~/git$ cd git-merge-testing/
user@host:~/git/git-merge-testing$ chmod u+x generate-gittery.sh
user@host:~/git/git-merge-testing$ ./generate-gittery.sh
Initialized empty Git repository in /home/matfra/git/git-merge-testing/repo.git/
Cloning into 'repo'...
warning: You appear to have cloned an empty repository.
done.
Cloning into 'repo'...
warning: You appear to have cloned an empty repository.
done.
Cloning into 'repo'...
warning: You appear to have cloned an empty repository.
done.
[main (root-commit) b534f4c] 1
 1 file changed, 1 insertion(+)
 create mode 100644 main
[main 0b31f24] 2
 1 file changed, 1 insertion(+), 1 deletion(-)
[main 31fa61e] 3
 1 file changed, 1 insertion(+), 1 deletion(-)
[main 8987863] 4
 1 file changed, 1 insertion(+), 1 deletion(-)
[main b08f844] 5
 1 file changed, 1 insertion(+), 1 deletion(-)
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (15/15), 987 bytes | 329.00 KiB/s, done.
Total 15 (delta 1), reused 0 (delta 0), pack-reused 0
To /home/matfra/git/git-merge-testing/repo.git
 * [new branch]      main -> main
Already up to date.
Switched to a new branch 'main-dev'
[main-dev 77f3a67] main: 6
 1 file changed, 1 insertion(+), 1 deletion(-)
[main-dev 3a8bf60] main: 7
 1 file changed, 1 insertion(+), 1 deletion(-)
[main-dev 145d5b9] main: 8
 1 file changed, 1 insertion(+), 1 deletion(-)
[main-dev 75f1ba4] main: 9
 1 file changed, 1 insertion(+), 1 deletion(-)
[main-dev dfa5835] main: 10
 1 file changed, 1 insertion(+), 1 deletion(-)
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 15 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (15/15), 967 bytes | 120.00 KiB/s, done.
From /home/matfra/git/git-merge-testing/repo
 * [new branch]      main       -> origin/main
Switched to a new branch 'second-dev'
[second-dev dcb5b0c] second: 11
 1 file changed, 1 insertion(+)
 create mode 100644 second
[second-dev 0e7d51e] second: 12
 1 file changed, 1 insertion(+), 1 deletion(-)
[second-dev 4db0f44] second: 13
 1 file changed, 1 insertion(+), 1 deletion(-)
[second-dev 24cbb80] second: 14
 1 file changed, 1 insertion(+), 1 deletion(-)
[second-dev 217d467] second: 15
 1 file changed, 1 insertion(+), 1 deletion(-)
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 15 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (15/15), 967 bytes | 161.00 KiB/s, done.
From /home/matfra/git/git-merge-testing/repo
 * [new branch]      main       -> origin/main
Switched to a new branch 'teritiary-dev'
[teritiary-dev fc68afd] teritiary: 16
 1 file changed, 1 insertion(+)
 create mode 100644 teritiary
[teritiary-dev e896803] teritiary: 17
 1 file changed, 1 insertion(+), 1 deletion(-)
[teritiary-dev 5d81ef5] teritiary: 18
 1 file changed, 1 insertion(+), 1 deletion(-)
[teritiary-dev cc78386] teritiary: 19
 1 file changed, 1 insertion(+), 1 deletion(-)
[teritiary-dev 6a072a5] teritiary: 20
 1 file changed, 1 insertion(+), 1 deletion(-)
repo.git:
* b08f844 (HEAD -> main) 5
* 8987863 4
* 31fa61e 3
* 0b31f24 2
* b534f4c 1
main-dev:
* dfa5835 (HEAD -> main-dev) main: 10
* 75f1ba4 main: 9
* 145d5b9 main: 8
* 3a8bf60 main: 7
* 77f3a67 main: 6
* b08f844 (origin/main, main) 5
* 8987863 4
* 31fa61e 3
* 0b31f24 2
* b534f4c 1
second-dev:
* 217d467 (HEAD -> second-dev) second: 15
* 24cbb80 second: 14
* 4db0f44 second: 13
* 0e7d51e second: 12
* dcb5b0c second: 11
* b08f844 (origin/main, main) 5
* 8987863 4
* 31fa61e 3
* 0b31f24 2
* b534f4c 1
teritiary-dev:
* 6a072a5 (HEAD -> teritiary-dev) teritiary: 20
* cc78386 teritiary: 19
* 5d81ef5 teritiary: 18
* e896803 teritiary: 17
* fc68afd teritiary: 16
* b08f844 (origin/main, main) 5
* 8987863 4
* 31fa61e 3
* 0b31f24 2
* b534f4c 1
```
### Goal
Something like:
```
user@host:~/git/git-merge-testing/main-dev$ git log --oneline --graph --all
*   f706fc7 (HEAD -> main, origin/main, main-dev) Merge branch 'teritiary-dev'
|\  
| * 6a072a5 teritiary: 20
| * cc78386 teritiary: 19
| * 5d81ef5 teritiary: 18
| * e896803 teritiary: 17
| * fc68afd teritiary: 16
* |   b5b6e77 Merge branch 'second-dev'
|\ \  
| * | 217d467 second: 15
| * | 24cbb80 second: 14
| * | 4db0f44 second: 13
| * | 0e7d51e second: 12
| * | dcb5b0c second: 11
| |/  
* | dfa5835 main: 10
* | 75f1ba4 main: 9
* | 145d5b9 main: 8
* | 3a8bf60 main: 7
* | 77f3a67 main: 6
|/  
* b08f844 5
* 8987863 4
* 31fa61e 3
* 0b31f24 2
* b534f4c 1
```

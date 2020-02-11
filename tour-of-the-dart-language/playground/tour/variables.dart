var name1 = 'Bob';

dynamic name2 = 'Bob';

String name3 = 'Bob';

int lineCount;
// assert(lineCount == null);

final name = 'Bob';
final String nickname = 'Bobby';
// name = 'Alice';

const bar1 = 1000000;
const double atm = 1.01325 * bar1;

var foo = const [];
final bar2 = const [];
const baz = [];
// foo = [1, 2, 3];
// baz = [42];

const Object i = 3;
const list = [i as int];
const map = {if (i is int) i: "int"};
// const set = {if (list is List(int) ...list};

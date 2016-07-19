## Explorační a konfirmační faktorová analýza

V rámci tohoto cvičení jsem pracovala s daty pocházejícími z výzkumu zaměřeného na postoj respondentů k zakládání rodiny a pořizování si dětí.
Baterie otázek obsahovala celkem 45 položek. Odpovídalo na ně 2010 respondentů.

Baterie obsahovala například tyto položky:
- Jedna z nejlepších věcí na dětech je, že se člověk nikdy necítí osamělý.
- Jedním z největších cílů života je mít děti.
- Rodina s dětmi je pro společnost základem pro vše dobré.
- Skutečně důležité věci pro život člověka se člověk naučí jenom ze zkušenosti s výchovou dětí.
- Člověka, který má děti, si lidé víc váží, než toho, který děti nemá.
- Dívka dospěje v ženu až poté, co se stane matkou.
- Děti člověka omezují v tom, že si nemůže dělat, co chce, a jít kam chce.
- Péče o děti je únavná a nezábavná záležitost.


### Explorační faktorová analýza
Nejdříve jsem provedla explorační faktorovu analýzu v SPSS. Na základě ní jsem se rozhodla pro rozřazení položek do tří faktorů.
První faktor sytily položky typu:
- Jedna z nejlepších věcí na dětech je, že se člověk nikdy necítí osamělý.
- Jedním z největších cílů života je mít děti.
- Pro většinu lidí by byl život bez dětí nudný a hloupý.
- Život člověka, který má děti, pokračuje v jistém smyslu i po jeho smrti.
- Faktor 1 jsem nazvala „Děti jako smysl života“.

Druhý faktor byl sycen například těmito položkami:
- Mladý pár je svým okolím plně akceptován až tehdy, když má dítě.
- Mít děti je povinností vůči společnosti.
- Vzhledem k tlaku ze strany rodiny a přátel člověk nemá příliš na výběr, zda mít nebo nemít děti.
- Dívka dospěje v ženu až poté, co se stane matkou.
- Muž má mít dítě, bez toho je jeho život planý.
- Faktor 2 jsem nazvala „Děti jako společenská povinnost“.

Třetí faktor sytily položky tohoto typu:
- Děti člověka omezují v tom, že si nemůže dělat, co chce, a jít kam chce.
- Neustálá přítomnost dětí znamená velké psychické vypětí.
- Když má člověk děti, musí se vzdát spousty věcí, které má rád.
- Děti způsobují mnoho neshod a problémů v partnerském vztahu.
- Pro mnoho lidí je výchova dětí velká finanční zátěž.
- Faktor 3 jsem nazvala „Děti jako omezení“.


### Konfirmační faktorová analýza
Výsledky explorační faktorové analýzy jsem poté ověřovala konfirmační faktorovou analýzou provedenou v programu Amos.

Výstupy analýzy byly následující:
- Grafické znázornění modelu bylo bohužel vzhledem k velkému počtu položek velmi obtížně čitelné.

Model
|`                `|`      χ2     `|`    df    `|`   CFI   `|`  RMSEA  `|
|------------------|--------------:|-----------:|----------:|----------:|
|`Default model   `|` 8583,397*** `|`   942    `|`  ,777   `|`  ,064   `|
*** p < ,001

Korelace mezi faktory
|`            `|`  Estimate  `|
|--------------|--------------|
|`F1 <--> F2  `|`   ,054     `|
|`F1 <--> F3  `|`   ,707     `|
|`F3 <--> F2  `|`   ,347     `|

Náboje faktorů
|`        `|` EFA    `|`  EFA   `|` EFA    `|` CFA    `|`  CFA   `|` CFA    `|
|----------|----------|----------|----------|----------|----------|----------|
|`Položka `|`Faktor 1`|`Faktor 2`|`Faktor 3`|`Faktor 1`|`Faktor 2`|`Faktor 3`|
|----------|----------|----------|----------|----------|----------|----------|
|`34      `|` ,688   `|`        `|`        `|` ,636   `|`        `|`        `|
|`41      `|` ,682   `|`        `|`        `|` ,714   `|`        `|`        `|
|`14      `|` ,681   `|` ,263   `|`        `|` ,515   `|`        `|`        `|
|`26      `|` ,662   `|`        `|`        `|` ,531   `|`        `|`        `|
|` 7      `|` ,638   `|`        `|`        `|` ,662   `|`        `|`        `|
|`27      `|` ,635   `|` ,228   `|`        `|` ,536   `|`        `|`        `|
|`31      `|` ,623   `|`        `|`        `|` ,640   `|`        `|`        `|
|`28      `|` ,618   `|` ,209   `|`        `|` ,589   `|`        `|`        `|
|`12      `|` ,617   `|`        `|`        `|` ,574   `|`        `|`        `|
|`19      `|` ,605   `|`        `|`        `|` ,581   `|`        `|`        `|
|`23      `|` ,594   `|`        `|`        `|` ,650   `|`        `|`        `|
|`42      `|` ,592   `|`  ,314  `|`        `|` ,639   `|`        `|`        `|
|`29      `|` ,585   `|`  ,281  `|`        `|` ,591   `|`        `|`        `|
|`13      `|` ,566   `|`  ,236  `|`        `|` ,539   `|`        `|`        `|
|`33      `|` ,546   `|`        `|`        `|` ,657   `|`        `|`        `|
|`17      `|` ,544   `|`  ,428  `|`        `|` ,641   `|`        `|`        `|
|` 5      `|` ,537   `|`  ,389  `|`        `|` ,606   `|`        `|`        `|
|` 6      `|` ,521   `|`  ,361  `|`        `|` ,610   `|`        `|`        `|
|` 4      `|` ,515   `|`  ,387  `|`        `|` ,580   `|`        `|`        `|
|`39      `|` ,472   `|`  ,395  `|`        `|` ,450   `|`        `|`        `|
|`22      `|` ,372   `|`  ,311  `|`        `|` ,422   `|`        `|`        `|
|` 2      `|` ,349   `|`  ,273  `|`        `|` ,636   `|`        `|`        `|
|`44      `|` ,310   `|`  ,680  `|`        `|`        `|` ,540   `|`        `|
|`20      `|`        `|`  ,675  `|`        `|`        `|` ,555   `|`        `|
|`11      `|`        `|`  ,669  `|`        `|`        `|` ,588   `|`        `|
|`25      `|`        `|`  ,655  `|`        `|`        `|` ,570   `|`        `|
|`43      `|` ,296   `|`  ,645  `|`        `|`        `|` ,354   `|`        `|
|`32      `|` ,258   `|`  ,625  `|`        `|`        `|` ,500   `|`        `|
|`10      `|`        `|`  ,605  `|`  ,233  `|`        `|` ,333   `|`        `|
|`37      `|`        `|`  ,587  `|`        `|`        `|` ,531   `|`        `|
|`15      `|` ,376   `|`  ,579  `|`        `|`        `|` ,581   `|`        `|
|`36      `|` ,460   `|`  ,550  `|`        `|`        `|` ,362   `|`        `|
|`21      `|` ,374   `|`  ,459  `|`        `|`        `|` ,540   `|`        `|
|` 3      `|` ,340   `|`  ,446  `|`        `|`        `|` ,555   `|`        `|
|`45      `|` ,236   `|`  ,439  `|`        `|`        `|` ,588   `|`        `|
|`18      `|`        `|`        `|`  ,656  `|`        `|`        `|` ,754   `|
|` 9      `|`        `|`        `|`  ,641  `|`        `|`        `|` ,663   `|
|`38      `|`        `|`        `|`  ,635  `|`        `|`        `|` ,623   `|
|`24      `|`        `|`  ,228  `|`  ,566  `|`        `|`        `|` ,601   `|
|`35      `|`        `|`        `|`  ,541  `|`        `|`        `|` ,689   `|
|`40      `|`        `|`        `|`  ,529  `|`        `|`        `|` ,670   `|
|` 8      `|` ,203   `|`        `|`  ,528  `|`        `|`        `|` ,456   `|
|` 1      `|`-,363   `|`  ,274  `|`  ,484  `|`        `|`        `|` ,434   `|
|`30      `|`-,245   `|`  ,432  `|`  ,484  `|`        `|`        `|` ,689   `|
|`16      `|`        `|`        `|`  ,392  `|`        `|`        `|` ,685   `|
EFA: rotace varimax
     p < ,000

##### Zhodnocení modelu
Na dotazníku by bylo potřeba dále ještě pracovat. Hodnota CFI je nízká a RMSEA naopak poměrně vysoká. Obzvláště některé položky druhého faktory mají nízký náboj a to samé by bylo možné říct také o dvou položkách
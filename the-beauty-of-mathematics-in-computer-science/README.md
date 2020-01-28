# The Beauty of Mathematics in Computer Science

## Words and languages, numbers and information

### 1.1 Information

In principle, there is little different between these primordial grunts and the latest methods of
information transmission, reception, and response.

![](https://raw.githubusercontent.com/LitoMore/data-science-notes/master/the-beauty-of-mathematics-in-computer-science/img/communication-model.jpg)

### 1.2 Words and numbers

When language and vocabulary grew to a certain size, they could no longer fit inside a single
human brain -- just as no one today can remember all the wisdom of mankind. A need for efficient
recording of information arose, and its solution was writing.

When a single world can take on many meanings, ambiguities inevitably emerge. Given different
environments, a word can dance from one meaning to another. Disambiguation, or determining the
specific meaning, has not change from tranditional linguists to modern computers: we must examine
the context. In most cases, the context will tell us the answer, but of course, there are always
outliers.

Two guiding principles from the Rosetta Stone story:

1. Redundancy vastly improves the chances that information can be communicated or stored without
   corruption. The Rosetta Stone repeated the same content three times, so if at least one version
   remains readable, the stone is decipherable.
2. Large amounts of bilingual of multilingual language data, known as a corpus, are essential to
   translation. These data are the bases of machine translation. In this aspect, we do not require
   more knowledge than Champollion possessed, for the Rosetta Stone. We simply own more computers
   and apply mathematical tools to speed up the process.

### 1.3 The mathematics behind language

Natural language inevitably follows the principles of information theory.

An object's description transformed from its outward appearence to an abstraction of its concept,
while humans subconsciously encoded these words as combinations of letters.

When a communication channel is wide, information can be sent directly; but if a communication
channel is wide, information can be sent directly; but if a communication is narrow, then
information must be compressed as much as possible before delivery and recovered upon receiving.

If we consider morphology (constructing words from letters) as the encoding rules from words, then
grammar captures the encoding and decoding for language. However, while we can enumerate all words
in a finite collection, the set of possible sentences is infinite. That is, a few tomes worth of
dictionary can list all the words in the English language, but on one can compile all English
writings ever to exist. Mathematically speaking, while the former can be completely described by a
finite set of rules (trivially, we can enumerate all words), the latter cannot.

### 1.4 Summary

- Principle of communication and the model of information dissemination
- Encoding, and shortest codes
- Decoding rules and syntax of language
- Clustering
- Checksums (error detection and correction)
- Bilingual texts and corpuses, useful in machine translation
- Ambiguity, and the importantce of context in eliminating ambiguity

Mathematics is the underlying thread through past and present.

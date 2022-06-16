#include <Rcpp.h>
using namespace std;
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector convert_trinucleotide_substitution(const CharacterVector &subs) {
    int n = subs.size();
    CharacterVector ret(n); 

    for(int i = 0; i < n; i++) {
        string val(subs(i));

        if(val.at(1) == 'G' || val.at(1) == 'A') { // need to reverse
            for(int c = 0; c < val.length(); c++) {
                if(val.at(c) == 'G') {
                    val[c] = 'C';
                } else if(val.at(c) == 'C') {
                    val[c] = 'G';
                } else if(val.at(c) == 'A') {
                    val[c] = 'T';
                } else if(val.at(c) == 'T') {
                    val[c] = 'A';
                }  // else equals "N" or ">" so do nothing
            }
        } 

        ret[i] = val;

    }

    return ret;
}

// [[Rcpp::export]]
CharacterVector convert_substitution(const CharacterVector &subs) {
    int n = subs.size();
    CharacterVector ret(n); 

    for(int i = 0; i < n; i++) {
        string val(subs(i));

        if(val.at(0) == 'G' || val.at(0) == 'A') { // need to reverse
            for(int c = 0; c < val.length(); c++) {
                if(val.at(c) == 'G') {
                    val[c] = 'C';
                } else if(val.at(c) == 'C') {
                    val[c] = 'G';
                } else if(val.at(c) == 'A') {
                    val[c] = 'T';
                } else if(val.at(c) == 'T') {
                    val[c] = 'A';
                }  // else equals "N" or ">" so do nothing
            }
        } 

        ret[i] = val;

    }

    return ret;
}

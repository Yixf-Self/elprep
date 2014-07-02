(in-package :cl-user)

(defpackage #:elprep
  (:documentation "A library for efficiently executing sequencing pipelines on SAM/BAM/CRAM files, taking advantage of modern multi-core processors.

Modifications to headers and alignments are expressed as filters. The library comes with a number of commonly used pre-defined filters, but you can also define and use your own filters. A pipeline can be executed with run-pipeline, which accepts SAM/BAM/CRAM files as input and/or output sources, but can also operate on an in-memory representation of such files. run-pipeline can be extended to also operate on other input/output sources, such as databases.

Refer to the documentation of run-pipeline as a starting point.")
  (:use 
   #:cl-date-time-parser
   #:common-lisp
   #:stream 
   #:string-case)
  (:import-from #:lispworks 
   #:current-pathname #:nconcf #:sbchar #:string-append #:if-let #:when-let)
  (:export 

   ;; sam-types

   #:int32

   #:*sam-file-format-version*

   #:sam-header #:make-sam-header #:sam-header-p
   #:sam-header-hd
   #:sam-header-sq
   #:sam-header-rg
   #:sam-header-pg
   #:sam-header-co
   #:sam-header-user-tags

   #:sam-header-ensure-hd

   #:sam-header-user-tag
   #:sam-header-user-tag-p

   #:sam-alignment #:make-sam-alignment #:sam-alignment-p
   #:sam-alignment-qname
   #:sam-alignment-flag
   #:sam-alignment-rname
   #:sam-alignment-pos
   #:sam-alignment-mapq
   #:sam-alignment-cigar
   #:sam-alignment-rnext
   #:sam-alignment-pnext
   #:sam-alignment-tlen
   #:sam-alignment-seq
   #:sam-alignment-qual
   #:sam-alignment-tags
   #:sam-alignment-xtags
   #:sam-alignment-temps

   #:sam-alignment-tag
   #:sam-alignment-xtag
   #:sam-alignment-temp
   #:sam-alignment-refid

   #:check-refid-type
   #:coordinate<

   #:+multiple+
   #:+proper+
   #:+unmapped+
   #:+next-unmapped+
   #:+reversed+
   #:+next-reversed+
   #:+first+
   #:+last+
   #:+secondary+
   #:+qc-failed+
   #:+duplicate+
   #:+supplementary+

   #:sam-alignment-multiple-p
   #:sam-alignment-proper-p
   #:sam-alignment-unmapped-p
   #:sam-alignment-next-unmapped-p
   #:sam-alignment-reversed-p
   #:sam-alignment-next-reversed-p
   #:sam-alignment-first-p
   #:sam-alignment-last-p
   #:sam-alignment-secondary-p
   #:sam-alignment-qc-failed-p
   #:sam-alignment-duplicate-p
   #:sam-alignment-supplementary-p

   #:sam-alignment-flag-every
   #:sam-alignment-flag-some
   #:sam-alignment-flag-notevery
   #:sam-alignment-flag-notany

   #:sam #:make-sam #:sam-p
   #:sam-header
   #:sam-alignments

   #:scan-cigar-string

   ;; sam-files

   #:scan-string
   #:scan-stringn
   #:scan-integer
   #:scan-float
   #:parse-sam-byte-array
   #:parse-sam-numeric-array

   #:parse-sam-header-line
   #:parse-sam-reference-sequence-dictionary-entry
   #:parse-sam-read-group
   #:parse-sam-program
   #:parse-sam-comment
   #:parse-sam-header
   #:parse-sam-alignment
   #:parse-sam

   #:format-sam-string
   #:format-sam-integer
   #:format-sam-byte-array
   #:format-sam-datetime
   #:format-sam-header-user-tag

   #:format-sam-header-line
   #:format-sam-reference-sequence-dictionary
   #:format-sam-read-groups
   #:format-sam-programs
   #:format-sam-comments
   #:format-sam-user-tags
   #:format-sam-header

   #:format-sam-tag
   #:format-sam-alignment

   #:format-sam

   #:get-samtools
   #:sam-file-kind
   #:open-sam
   #:open-temporary-sam

   ;; filter-pipeline

   #:*number-of-threads*
   #:+default-chunk-size+

   #:run-pipeline
   #:run-pipeline-in-situ
   #:get-output-functions


   #:compose-global-filters #:with-thread-filters
   #:compose-thread-filters #:with-alignment-filters
   #:create-chunk-filter
   #:with-output-functions
   #:chunk-output-loop #:with-chunk-output

   #:effective-sorting-order

   #:call-with-processes

   ;; filters

   #:replace-reference-sequence-dictionary
   #:replace-reference-sequence-dictionary-from-sam-file
   #:filter-unmapped-reads
   #:filter-unmapped-reads-strict
   #:filter-duplicate-reads
   #:add-or-replace-read-group
   #:parse-read-group-from-string
   #:add-pg-line
   #:clean-sam
   #:add-refid

   #:sam-alignment-rg
   #:compute-phred-score
   #:compute-unclipped-position
   #:mark-duplicates
 
   ;; ui

   #:elprep-script
))

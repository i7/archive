Repeat Boxes by Dave Robinson begins here.

"Allows repeated displaying of boxed quotations."

To redisplay the boxed quotation (Q - boxed-quotation):
	(- RedisplayBoxedQuotation({Q}); -).

Include (- Replace ClearBoxedText; -) before "Printing.i6t".

Include (-
Global pending_rebox;
[ RedisplayBoxedQuotation Q;
	pending_rebox = Q;
];

[ ClearBoxedText i;
  if (pending_boxed_quotation) {
		for (i=0: Runtime_Quotations_Displayed-->i: i++)
			if (Runtime_Quotations_Displayed-->i == pending_boxed_quotation) {
				pending_boxed_quotation = 0;
				break;
			}
  }
  if (pending_boxed_quotation) {
		Runtime_Quotations_Displayed-->i = pending_boxed_quotation;

		ClearParagraphing();
		pending_boxed_quotation();
		ClearParagraphing();

		pending_boxed_quotation = 0;
	}
  else if (pending_rebox) {
	ClearParagraphing();
	pending_rebox();
	ClearParagraphing();
	pending_rebox = 0;
  }
];
-).

Repeat Boxes ends here.

---- DOCUMENTATION ----

The command

	redisplay the boxed quotation "Canis meus id comedit."

will display a boxed quotation every turn the command is executed, instead of just once.

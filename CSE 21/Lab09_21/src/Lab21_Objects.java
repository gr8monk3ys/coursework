public class Lab21_Objects {

	public static void main(String[] args) {
		// DO NOT CREATE NEW VARIABLES

		Dummy[] dlist = new Dummy[11];
		int[] iarr = new int[11];
		double[] darr = new double[11];

		// DO NOT USE ANY CONSTANTS OR NEW VARIABLES

		// Calls to Constructors 1 and 2
		dlist[0] = new Dummy();
		dlist[1] = new Dummy(iarr[0]);
		dlist[2] = new Dummy(darr[0]);
		dlist[3] = new Dummy(iarr);
		dlist[4] = new Dummy(darr);
		dlist[5] = new Dummy(dlist[0]);
		dlist[6] = new Dummy(dlist);
		dlist[7] = new Dummy(iarr[1], darr[1]);
		dlist[8] = new Dummy(iarr, darr);
		dlist[9] = new Dummy(iarr[2], darr[2], dlist[1]);
		dlist[10] = new Dummy(iarr, darr, dlist);

		// Fill-in calls to Constructors 3-11 and assign them to dlist array indices
		// 2-10

		// Calls to diplay methods 1 and 2
		dlist[0].display();
		dlist[1].display(iarr[0]);
		dlist[2].display(darr[0]);
		dlist[3].display(iarr);
		dlist[4].display(darr);
		dlist[5].display(dlist[0]);
		dlist[6].display(dlist);
		dlist[7].display(iarr[1], darr[1]);
		dlist[8].display(iarr, darr);
		dlist[9].display(iarr[2], darr[2], dlist[1]);
		dlist[10].display(iarr, darr, dlist);

		// Fill-in calls to display methods 3-11 for the dlist objects at indices 2-10
	}
}

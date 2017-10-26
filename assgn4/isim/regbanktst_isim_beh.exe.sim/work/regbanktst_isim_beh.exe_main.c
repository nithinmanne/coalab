/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003239917653_2175365797_init();
    work_m_00000000000653565311_3673085417_init();
    work_m_00000000002267221789_1708000369_init();
    work_m_00000000002209328390_2347798531_init();
    work_m_00000000000374592455_1621107508_init();
    work_m_00000000003067520523_0878684766_init();
    work_m_00000000001630957065_1013108644_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001630957065_1013108644");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}

import { lazy } from 'react'
import type { RouteObject } from 'react-router-dom'
import { Navigate } from 'react-router-dom'
import { Error404, Error403 } from '@/components/Error'

export const routers: RouteObject[] = [
    {
        path: '/home',
        Component: lazy(() => import('@/components/PromLayout')),
        children: [
            {
                path: '/home',
                Component: lazy(() => import('@/pages/home'))
            },
            {
                path: '/home/monitor/strategy-group',
                Component: lazy(
                    () => import('@/pages/home/monitor/strategy-group')
                ),
                children: []
            },
            {
                path: '/home/monitor/strategy-group/strategy',
                Component: lazy(
                    () => import('@/pages/home/monitor/strategy-group/strategy')
                )
            },
            {
                path: '/home/monitor/endpoint',
                Component: lazy(() => import('@/pages/home/monitor/endpoint'))
            },
            {
                path: '/home/monitor/alarm-group',
                Component: lazy(
                    () => import('@/pages/home/monitor/alarm-group')
                )
            },
            {
                path: '/home/monitor/chat-hook',
                Component: lazy(() => import('@/pages/home/monitor/chat-hook'))
            },
            {
                path: '/home/monitor/alarm-realtime',
                Component: lazy(
                    () => import('@/pages/home/monitor/alarm-realtime')
                )
            },
            {
                path: '/home/monitor/alarm-history',
                Component: lazy(
                    () => import('@/pages/home/monitor/alarm-history')
                )
            },
            {
                path: '/home/system/user',
                Component: lazy(() => import('@/pages/home/system/user'))
            },
            {
                path: '/home/system/dict',
                Component: lazy(() => import('@/pages/home/system/dict'))
            },
            {
                path: '/home/system/role',
                Component: lazy(() => import('@/pages/home/system/role'))
            },
            {
                path: '/home/system/menu',
                Component: lazy(() => import('@/pages/home/system/menu'))
            },
            {
                path: '/home/system/auth',
                Component: lazy(() => import('@/pages/home/system/auth'))
            },
            {
                // 404
                path: '*',
                element: <Error404 />
            }
        ]
    },
    {
        path: '/login',
        Component: lazy(() => import('@/pages/login'))
    },
    {
        path: '/',
        // 重定向/home
        element: <Navigate to="/home" replace={true} />
    },
    {
        // 403
        path: '*',
        element: <Error403 />
    }
]
